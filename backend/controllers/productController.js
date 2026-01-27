import { promisePool } from '../config/db.js';

// @desc    Get all products with optional filters
// @route   GET /api/products
// @access  Public
const getAllProducts = async (req, res, next) => {
  try {
    const { category, featured, search, min_price, max_price, limit = 50, offset = 0 } = req.query;

    let query = 'SELECT p.*, c.name as category_name, c.slug as category_slug FROM Products p LEFT JOIN Categories c ON p.category_id = c.id WHERE 1=1';
    const params = [];

    // Apply filters
    if (category) {
      query += ' AND c.slug = ?';
      params.push(category);
    }

    if (featured === 'true') {
      query += ' AND p.is_featured = 1';
    }

    if (search) {
      query += ' AND (p.name LIKE ? OR p.description LIKE ?)';
      params.push(`%${search}%`, `%${search}%`);
    }

    if (min_price) {
      query += ' AND p.price >= ?';
      params.push(parseFloat(min_price));
    }

    if (max_price) {
      query += ' AND p.price <= ?';
      params.push(parseFloat(max_price));
    }

    // Add ordering and pagination
    query += ' ORDER BY p.is_featured DESC, p.created_at DESC LIMIT ? OFFSET ?';
    params.push(parseInt(limit), parseInt(offset));

    const [products] = await promisePool.query(query, params);

    // Get total count for pagination
    let countQuery = 'SELECT COUNT(*) as total FROM Products p LEFT JOIN Categories c ON p.category_id = c.id WHERE 1=1';
    const countParams = [];

    if (category) {
      countQuery += ' AND c.slug = ?';
      countParams.push(category);
    }

    if (featured === 'true') {
      countQuery += ' AND p.is_featured = 1';
    }

    if (search) {
      countQuery += ' AND (p.name LIKE ? OR p.description LIKE ?)';
      countParams.push(`%${search}%`, `%${search}%`);
    }

    if (min_price) {
      countQuery += ' AND p.price >= ?';
      countParams.push(parseFloat(min_price));
    }

    if (max_price) {
      countQuery += ' AND p.price <= ?';
      countParams.push(parseFloat(max_price));
    }

    const [countResult] = await promisePool.query(countQuery, countParams);

    res.status(200).json({
      success: true,
      count: products.length,
      total: countResult[0].total,
      data: products
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Get single product by ID
// @route   GET /api/products/:id
// @access  Public
const getProductById = async (req, res, next) => {
  try {
    const { id } = req.params;

    const [products] = await promisePool.query(
      `SELECT p.*, c.name as category_name, c.slug as category_slug 
       FROM Products p 
       LEFT JOIN Categories c ON p.category_id = c.id 
       WHERE p.id = ?`,
      [id]
    );

    if (products.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Product not found'
      });
    }

    // Parse metadata JSON if it exists
    const product = products[0];
    if (product.metadata) {
      try {
        product.metadata = JSON.parse(product.metadata);
      } catch (e) {
        // If parsing fails, keep as string
      }
    }

    // Get gallery images
    const [galleryImages] = await promisePool.query(
      'SELECT * FROM ProductImages WHERE product_id = ? ORDER BY sort_order ASC',
      [id]
    );
    product.gallery_images = galleryImages;

    res.status(200).json({
      success: true,
      data: product
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Get products by category
// @route   GET /api/products/category/:categoryId
// @access  Public
const getProductsByCategory = async (req, res, next) => {
  try {
    const { categoryId } = req.params;

    const [products] = await promisePool.query(
      `SELECT p.*, c.name as category_name, c.slug as category_slug 
       FROM Products p 
       LEFT JOIN Categories c ON p.category_id = c.id 
       WHERE p.category_id = ? 
       ORDER BY p.is_featured DESC, p.name ASC`,
      [categoryId]
    );

    res.status(200).json({
      success: true,
      count: products.length,
      data: products
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Create new product
// @route   POST /api/products
// @access  Private/Admin
const createProduct = async (req, res, next) => {
  try {
    const {
      category_id,
      name,
      price,
      description,
      wattage,
      durability_rating,
      battery_type,
      warranty_info,
      video_url,
      metadata,
      is_featured,
      stock_status
    } = req.body;

    let image_url = req.body.image_url;
    let manual_pdf_url = req.body.manual_pdf_url;

    // Handle file uploads
    if (req.files) {
      if (req.files.image) {
        image_url = `/uploads/products/${req.files.image[0].filename}`;
      }
      if (req.files.manual) {
        manual_pdf_url = `/uploads/manuals/${req.files.manual[0].filename}`;
      }
    }

    // Validate required fields
    if (!category_id || !name || !price) {
      return res.status(400).json({
        success: false,
        message: 'Please provide category_id, name, and price'
      });
    }

    // Validate category exists
    const [categoryExists] = await promisePool.query(
      'SELECT id FROM Categories WHERE id = ?',
      [category_id]
    );

    if (categoryExists.length === 0) {
      return res.status(400).json({
        success: false,
        message: 'Invalid category_id'
      });
    }

    // Convert metadata to JSON string if it's an object
    let metadataStr = metadata;
    if (typeof metadata === 'object') {
      metadataStr = JSON.stringify(metadata);
    }

    // Insert product
    const [result] = await promisePool.query(
      `INSERT INTO Products 
       (category_id, name, price, description, wattage, durability_rating, 
        battery_type, warranty_info, image_url, manual_pdf_url, video_url, metadata, 
        is_featured, stock_status) 
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [
        category_id,
        name,
        price,
        description,
        wattage,
        durability_rating,
        battery_type,
        warranty_info,
        image_url,
        manual_pdf_url,
        video_url,
        metadataStr,
        is_featured === 'true' || is_featured === true ? 1 : 0,
        stock_status || 'in_stock'
      ]
    );

    // Handle gallery images insertion
    if (req.files && req.files.gallery_images) {
      const galleryPromises = req.files.gallery_images.map((file, index) => {
        const imageUrl = `/uploads/products/${file.filename}`;
        return promisePool.query(
          'INSERT INTO ProductImages (product_id, image_url, sort_order) VALUES (?, ?, ?)',
          [result.insertId, imageUrl, index]
        );
      });
      await Promise.all(galleryPromises);
    }

    // Get the created product
    const [newProduct] = await promisePool.query(
      'SELECT * FROM Products WHERE id = ?',
      [result.insertId]
    );

    res.status(201).json({
      success: true,
      message: 'Product created successfully',
      data: newProduct[0]
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Update product
// @route   PUT /api/products/:id
// @access  Private/Admin
const updateProduct = async (req, res, next) => {
  try {
    const { id } = req.params;
    const updateData = req.body;

    // Handle file uploads
    if (req.files) {
      if (req.files.image) {
        updateData.image_url = `/uploads/products/${req.files.image[0].filename}`;
      }
      if (req.files.manual) {
        updateData.manual_pdf_url = `/uploads/manuals/${req.files.manual[0].filename}`;
      }
    }

    // Check if product exists
    const [existing] = await promisePool.query(
      'SELECT * FROM Products WHERE id = ?',
      [id]
    );

    if (existing.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Product not found'
      });
    }

    // Build update query dynamically
    const updates = [];
    const values = [];

    const allowedFields = [
      'category_id',
      'name',
      'price',
      'description',
      'wattage',
      'durability_rating',
      'battery_type',
      'warranty_info',
      'image_url',
      'manual_pdf_url',
      'video_url',
      'metadata',
      'is_featured',
      'stock_status'
    ];

    allowedFields.forEach(field => {
      if (updateData[field] !== undefined) {
        updates.push(`${field} = ?`);
        
        // Convert metadata to JSON string if it's an object
        if (field === 'metadata' && typeof updateData[field] === 'object') {
          values.push(JSON.stringify(updateData[field]));
        } else if (field === 'is_featured') {
          values.push(updateData[field] === 'true' || updateData[field] === true ? 1 : 0);
        } else {
          values.push(updateData[field]);
        }
      }
    });

    if (updates.length === 0) {
      return res.status(400).json({
        success: false,
        message: 'No fields to update'
      });
    }

    values.push(id);

    await promisePool.query(
      `UPDATE Products SET ${updates.join(', ')} WHERE id = ?`,
      values
    );

    // Handle new gallery images insertion (append to existing)
    if (req.files && req.files.gallery_images) {
      const galleryPromises = req.files.gallery_images.map((file, index) => {
        const imageUrl = `/uploads/products/${file.filename}`;
        return promisePool.query(
          'INSERT INTO ProductImages (product_id, image_url, sort_order) VALUES (?, ?, ?)',
          [id, imageUrl, index]
        );
      });
      await Promise.all(galleryPromises);
    }

    // Get updated product
    const [updated] = await promisePool.query(
      'SELECT * FROM Products WHERE id = ?',
      [id]
    );

    res.status(200).json({
      success: true,
      message: 'Product updated successfully',
      data: updated[0]
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Delete product
// @route   DELETE /api/products/:id
// @access  Private/Admin
const deleteProduct = async (req, res, next) => {
  try {
    const { id } = req.params;

    // Check if product exists
    const [existing] = await promisePool.query(
      'SELECT * FROM Products WHERE id = ?',
      [id]
    );

    if (existing.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Product not found'
      });
    }

    // Delete product
    await promisePool.query('DELETE FROM Products WHERE id = ?', [id]);

    res.status(200).json({
      success: true,
      message: 'Product deleted successfully'
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Delete product image
// @route   DELETE /api/products/images/:imageId
// @access  Private/Admin
const deleteProductImage = async (req, res, next) => {
  try {
    const { imageId } = req.params;

    // Check if image exists
    const [images] = await promisePool.query('SELECT id FROM ProductImages WHERE id = ?', [imageId]);
    if (images.length === 0) {
      return res.status(404).json({ success: false, message: 'Image not found' });
    }

    // Delete from database
    await promisePool.query('DELETE FROM ProductImages WHERE id = ?', [imageId]);

    res.status(200).json({ success: true, message: 'Image deleted successfully' });
  } catch (error) {
    next(error);
  }
};

export {
  getAllProducts,
  getProductById,
  getProductsByCategory,
  createProduct,
  updateProduct,
  deleteProduct,
  deleteProductImage
};
