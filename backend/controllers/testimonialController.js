import { promisePool } from '../config/db.js';

// @desc    Get approved testimonials
// @route   GET /api/testimonials
// @access  Public
const getApprovedTestimonials = async (req, res, next) => {
  try {
    const { country, limit = 20, offset = 0 } = req.query;

    let query = 'SELECT * FROM Testimonials WHERE is_approved = 1';
    const params = [];

    // Filter by country if provided
    if (country) {
      query += ' AND country = ?';
      params.push(country);
    }

    query += ' ORDER BY created_at DESC LIMIT ? OFFSET ?';
    params.push(parseInt(limit), parseInt(offset));

    const [testimonials] = await promisePool.query(query, params);

    // Get total count
    let countQuery = 'SELECT COUNT(*) as total FROM Testimonials WHERE is_approved = 1';
    const countParams = [];

    if (country) {
      countQuery += ' AND country = ?';
      countParams.push(country);
    }

    const [countResult] = await promisePool.query(countQuery, countParams);

    res.status(200).json({
      success: true,
      count: testimonials.length,
      total: countResult[0].total,
      data: testimonials
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Get all testimonials (including unapproved)
// @route   GET /api/testimonials/all
// @access  Private/Admin
const getAllTestimonials = async (req, res, next) => {
  try {
    const { approved, country, limit = 50, offset = 0 } = req.query;

    let query = 'SELECT * FROM Testimonials WHERE 1=1';
    const params = [];

    // Filter by approval status
    if (approved !== undefined) {
      query += ' AND is_approved = ?';
      params.push(approved === 'true' ? 1 : 0);
    }

    // Filter by country
    if (country) {
      query += ' AND country = ?';
      params.push(country);
    }

    query += ' ORDER BY created_at DESC LIMIT ? OFFSET ?';
    params.push(parseInt(limit), parseInt(offset));

    const [testimonials] = await promisePool.query(query, params);

    // Get total count
    let countQuery = 'SELECT COUNT(*) as total FROM Testimonials WHERE 1=1';
    const countParams = [];

    if (approved !== undefined) {
      countQuery += ' AND is_approved = ?';
      countParams.push(approved === 'true' ? 1 : 0);
    }

    if (country) {
      countQuery += ' AND country = ?';
      countParams.push(country);
    }

    const [countResult] = await promisePool.query(countQuery, countParams);

    res.status(200).json({
      success: true,
      count: testimonials.length,
      total: countResult[0].total,
      data: testimonials
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Get single testimonial by ID
// @route   GET /api/testimonials/:id
// @access  Private/Admin
const getTestimonialById = async (req, res, next) => {
  try {
    const { id } = req.params;

    const [testimonials] = await promisePool.query(
      'SELECT * FROM Testimonials WHERE id = ?',
      [id]
    );

    if (testimonials.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Testimonial not found'
      });
    }

    res.status(200).json({
      success: true,
      data: testimonials[0]
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Create new testimonial
// @route   POST /api/testimonials
// @access  Public (but requires approval)
const createTestimonial = async (req, res, next) => {
  try {
    const {
      client_name,
      country,
      video_url,
      content,
      rating
    } = req.body;

    let before_image_url = req.body.before_image_url;
    let after_image_url = req.body.after_image_url;

    // Handle file uploads
    if (req.files) {
      if (req.files.before_image) {
        before_image_url = `/uploads/testimonials/${req.files.before_image[0].filename}`;
      }
      if (req.files.after_image) {
        after_image_url = `/uploads/testimonials/${req.files.after_image[0].filename}`;
      }
    }

    // Validate required fields
    if (!client_name || !country || !content) {
      return res.status(400).json({
        success: false,
        message: 'Please provide client_name, country, and content'
      });
    }

    // Validate rating if provided
    if (rating && (rating < 1 || rating > 5)) {
      return res.status(400).json({
        success: false,
        message: 'Rating must be between 1 and 5'
      });
    }

    // Insert testimonial (not approved by default)
    const [result] = await promisePool.query(
      `INSERT INTO Testimonials 
       (client_name, country, video_url, before_image_url, after_image_url, 
        content, rating, is_approved) 
       VALUES (?, ?, ?, ?, ?, ?, ?, 0)`,
      [
        client_name,
        country,
        video_url,
        before_image_url,
        after_image_url,
        content,
        rating || null
      ]
    );

    // Get the created testimonial
    const [newTestimonial] = await promisePool.query(
      'SELECT * FROM Testimonials WHERE id = ?',
      [result.insertId]
    );

    res.status(201).json({
      success: true,
      message: 'Testimonial submitted successfully. It will be reviewed before being published.',
      data: newTestimonial[0]
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Approve testimonial
// @route   PUT /api/testimonials/:id/approve
// @access  Private/Admin
const approveTestimonial = async (req, res, next) => {
  try {
    const { id } = req.params;

    // Check if testimonial exists
    const [existing] = await promisePool.query(
      'SELECT * FROM Testimonials WHERE id = ?',
      [id]
    );

    if (existing.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Testimonial not found'
      });
    }

    // Update approval status
    await promisePool.query(
      'UPDATE Testimonials SET is_approved = 1 WHERE id = ?',
      [id]
    );

    // Get updated testimonial
    const [updated] = await promisePool.query(
      'SELECT * FROM Testimonials WHERE id = ?',
      [id]
    );

    res.status(200).json({
      success: true,
      message: 'Testimonial approved successfully',
      data: updated[0]
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Unapprove testimonial
// @route   PUT /api/testimonials/:id/unapprove
// @access  Private/Admin
const unapproveTestimonial = async (req, res, next) => {
  try {
    const { id } = req.params;

    // Check if testimonial exists
    const [existing] = await promisePool.query(
      'SELECT * FROM Testimonials WHERE id = ?',
      [id]
    );

    if (existing.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Testimonial not found'
      });
    }

    // Update approval status
    await promisePool.query(
      'UPDATE Testimonials SET is_approved = 0 WHERE id = ?',
      [id]
    );

    // Get updated testimonial
    const [updated] = await promisePool.query(
      'SELECT * FROM Testimonials WHERE id = ?',
      [id]
    );

    res.status(200).json({
      success: true,
      message: 'Testimonial unapproved successfully',
      data: updated[0]
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Update testimonial
// @route   PUT /api/testimonials/:id
// @access  Private/Admin
const updateTestimonial = async (req, res, next) => {
  try {
    const { id } = req.params;
    const updateData = req.body;

    // Handle file uploads
    if (req.files) {
      if (req.files.before_image) {
        updateData.before_image_url = `/uploads/testimonials/${req.files.before_image[0].filename}`;
      }
      if (req.files.after_image) {
        updateData.after_image_url = `/uploads/testimonials/${req.files.after_image[0].filename}`;
      }
    }

    // Check if testimonial exists
    const [existing] = await promisePool.query(
      'SELECT * FROM Testimonials WHERE id = ?',
      [id]
    );

    if (existing.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Testimonial not found'
      });
    }

    // Build update query dynamically
    const updates = [];
    const values = [];

    const allowedFields = [
      'client_name',
      'country',
      'video_url',
      'before_image_url',
      'after_image_url',
      'content',
      'rating',
      'is_approved'
    ];

    allowedFields.forEach(field => {
      if (updateData[field] !== undefined) {
        updates.push(`${field} = ?`);
        values.push(updateData[field]);
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
      `UPDATE Testimonials SET ${updates.join(', ')} WHERE id = ?`,
      values
    );

    // Get updated testimonial
    const [updated] = await promisePool.query(
      'SELECT * FROM Testimonials WHERE id = ?',
      [id]
    );

    res.status(200).json({
      success: true,
      message: 'Testimonial updated successfully',
      data: updated[0]
    });
  } catch (error) {
    next(error);
  }
};

// @desc    Delete testimonial
// @route   DELETE /api/testimonials/:id
// @access  Private/Admin
const deleteTestimonial = async (req, res, next) => {
  try {
    const { id } = req.params;

    // Check if testimonial exists
    const [existing] = await promisePool.query(
      'SELECT * FROM Testimonials WHERE id = ?',
      [id]
    );

    if (existing.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Testimonial not found'
      });
    }

    // Delete testimonial
    await promisePool.query('DELETE FROM Testimonials WHERE id = ?', [id]);

    res.status(200).json({
      success: true,
      message: 'Testimonial deleted successfully'
    });
  } catch (error) {
    next(error);
  }
};

export {
  getApprovedTestimonials,
  getAllTestimonials,
  getTestimonialById,
  createTestimonial,
  approveTestimonial,
  unapproveTestimonial,
  updateTestimonial,
  deleteTestimonial
};
