import { promisePool } from '../config/db.js';

// @desc    Get all kits
// @route   GET /api/kits
// @access  Public
const getAllKits = async (req, res, next) => {
  try {
    const { featured, limit = 50, offset = 0 } = req.query;

    let query = 'SELECT * FROM Kits WHERE 1=1';
    const params = [];

    if (featured === 'true') {
      query += ' AND is_featured = 1';
    }

    query += ' ORDER BY is_featured DESC, created_at DESC LIMIT ? OFFSET ?';
    params.push(parseInt(limit), parseInt(offset));

    const [kits] = await promisePool.query(`
      SELECT k.*, COUNT(DISTINCT kp.product_id) as products_count
      FROM Kits k 
      LEFT JOIN KitProducts kp ON k.id = kp.kit_id 
      WHERE 1=1 ${featured === 'true' ? 'AND k.is_featured = 1' : ''}
      GROUP BY k.id
      ORDER BY k.is_featured DESC, k.created_at DESC 
      LIMIT ? OFFSET ?
    `, params);

    // Get total count
    let countQuery = `SELECT COUNT(*) as total FROM Kits WHERE 1=1`;
    if (featured === 'true') {
      countQuery += ' AND is_featured = 1';
    }
    const [countResult] = await promisePool.query(countQuery);

    res.status(200).json({
      success: true,
      count: kits.length,
      total: countResult[0].total,
      data: kits
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Get kit by ID with products
// @route   GET /api/kits/:id
// @access  Public
const getKitById = async (req, res, next) => {
  try {
    const { id } = req.params;

    // Get kit
    const [kits] = await promisePool.query(
      'SELECT * FROM Kits WHERE id = ? OR slug = ?',
      [id, id]
    );

    if (kits.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Kit not found'
      });
    }

    const kit = kits[0];

    // Get products in this kit
    const [kitProducts] = await promisePool.query(
      `SELECT p.*, kp.quantity, kp.sort_order
       FROM KitProducts kp
       JOIN Products p ON kp.product_id = p.id
       WHERE kp.kit_id = ?
       ORDER BY kp.sort_order ASC, p.name ASC`,
      [kit.id]
    );

    res.status(200).json({
      success: true,
      data: {
        ...kit,
        products: kitProducts
      }
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Create new kit
// @route   POST /api/kits
// @access  Private/Admin
const createKit = async (req, res, next) => {
  try {
    let { name, description, slug, products = [] } = req.body;
    let image_url = req.body.image_url;
    if (typeof products == 'string') {
      products = JSON.parse(products);
    }
    // If file was uploaded, use the uploaded file path
    if (req.file) {
      image_url = `/uploads/kits/${req.file.filename}`;
    }

    // Validate required fields
    if (!name || !slug) {
      return res.status(400).json({
        success: false,
        message: 'Please provide name and slug'
      });
    }

    // Insert kit
    const [result] = await promisePool.query(
      'INSERT INTO Kits (name, description, image_url, slug) VALUES (?, ?, ?, ?)',
      [name, description, image_url, slug]
    );

    const kitId = result.insertId;

    // Add products to kit if provided
    if (products.length > 0) {
      const productInserts = products.map((product, index) => [
        kitId,
        product.product_id,
        product.quantity || 1,
        index
      ]);

      await promisePool.query(
        'INSERT INTO KitProducts (kit_id, product_id, quantity, sort_order) VALUES ?',
        [productInserts]
      );
    }

    // Get the created kit with products
    const [newKit] = await promisePool.query(
      'SELECT * FROM Kits WHERE id = ?',
      [kitId]
    );

    const [kitProds] = await promisePool.query(
      `SELECT p.*, kp.quantity, kp.sort_order
       FROM KitProducts kp
       JOIN Products p ON kp.product_id = p.id
       WHERE kp.kit_id = ?
       ORDER BY kp.sort_order ASC`,
      [kitId]
    );

    res.status(201).json({
      success: true,
      message: 'Kit created successfully',
      data: {
        ...newKit[0],
        products: kitProds
      }
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Update kit
// @route   PUT /api/kits/:id
// @access  Private/Admin
const updateKit = async (req, res, next) => {
  try {
    const { id } = req.params;
    const { name, description, slug, products = [] } = req.body;
    let image_url = req.body.image_url;

    // If file was uploaded, use the uploaded file path
    if (req.file) {
      image_url = `/uploads/kits/${req.file.filename}`;
    }

    // Check if kit exists
    const [existing] = await promisePool.query(
      'SELECT * FROM Kits WHERE id = ?',
      [id]
    );

    if (existing.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Kit not found'
      });
    }

    // Build update query dynamically
    const updates = [];
    const values = [];

    if (name) {
      updates.push('name = ?');
      values.push(name);
    }
    if (description !== undefined) {
      updates.push('description = ?');
      values.push(description);
    }
    if (image_url) {
      updates.push('image_url = ?');
      values.push(image_url);
    }
    if (slug) {
      updates.push('slug = ?');
      values.push(slug);
    }

    if (updates.length > 0) {
      values.push(id);
      await promisePool.query(
        `UPDATE Kits SET ${updates.join(', ')} WHERE id = ?`,
        values
      );
    }

    // Update kit products
    if (products.length > 0) {
      // Delete existing products
      await promisePool.query(
        'DELETE FROM KitProducts WHERE kit_id = ?',
        [id]
      );

      // Insert new products
      const productInserts = products.map((product, index) => [
        id,
        product.product_id,
        product.quantity || 1,
        index
      ]);

      await promisePool.query(
        'INSERT INTO KitProducts (kit_id, product_id, quantity, sort_order) VALUES ?',
        [productInserts]
      );
    }

    // Get updated kit
    const [updated] = await promisePool.query(
      'SELECT * FROM Kits WHERE id = ?',
      [id]
    );

    const [kitProds] = await promisePool.query(
      `SELECT p.*, kp.quantity, kp.sort_order
       FROM KitProducts kp
       JOIN Products p ON kp.product_id = p.id
       WHERE kp.kit_id = ?
       ORDER BY kp.sort_order ASC`,
      [id]
    );

    res.status(200).json({
      success: true,
      message: 'Kit updated successfully',
      data: {
        ...updated[0],
        products: kitProds
      }
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Delete kit
// @route   DELETE /api/kits/:id
// @access  Private/Admin
const deleteKit = async (req, res, next) => {
  try {
    const { id } = req.params;

    // Check if kit exists
    const [existing] = await promisePool.query(
      'SELECT * FROM Kits WHERE id = ?',
      [id]
    );

    if (existing.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Kit not found'
      });
    }

    // Delete kit (cascade delete will remove kit products)
    await promisePool.query(
      'DELETE FROM Kits WHERE id = ?',
      [id]
    );

    res.status(200).json({
      success: true,
      message: 'Kit deleted successfully'
    });
  } catch (error) {
    next(error);
  }
};

export {
  getAllKits,
  getKitById,
  createKit,
  updateKit,
  deleteKit
};
