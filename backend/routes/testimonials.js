import express from 'express';
import {
  getApprovedTestimonials,
  getAllTestimonials,
  getTestimonialById,
  createTestimonial,
  approveTestimonial,
  unapproveTestimonial,
  updateTestimonial,
  deleteTestimonial
} from '../controllers/testimonialController.js';
import { authenticateToken } from '../middleware/auth.js';
import { uploadTestimonialFiles, handleUploadError } from '../middleware/upload.js';

const router = express.Router();

// Public routes
router.get('/', getApprovedTestimonials);
router.post(
  '/',
  uploadTestimonialFiles,
  handleUploadError,
  createTestimonial
);

// Protected routes (Admin only)
router.get('/all', authenticateToken, getAllTestimonials);
router.get('/:id', authenticateToken, getTestimonialById);
router.put('/:id/approve', authenticateToken, approveTestimonial);
router.put('/:id/unapprove', authenticateToken, unapproveTestimonial);
router.put(
  '/:id',
  authenticateToken,
  uploadTestimonialFiles,
  handleUploadError,
  updateTestimonial
);
router.delete('/:id', authenticateToken, deleteTestimonial);

export default router;
