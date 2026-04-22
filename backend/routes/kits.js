import express from 'express';
import {
  getAllKits,
  getKitById,
  createKit,
  updateKit,
  deleteKit
} from '../controllers/kitController.js';
import { authenticateToken } from '../middleware/auth.js';
import { uploadSingleImage, handleUploadError } from '../middleware/upload.js';

const router = express.Router();

// Public routes
router.get('/', getAllKits);
router.get('/:id', getKitById);

// Protected routes (Admin only)
router.post(
  '/',
  authenticateToken,
  uploadSingleImage,
  handleUploadError,
  createKit
);

router.put(
  '/:id',
  authenticateToken,
  uploadSingleImage,
  handleUploadError,
  updateKit
);

router.delete('/:id', authenticateToken, deleteKit);

export default router;
