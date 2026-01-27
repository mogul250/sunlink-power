import multer from 'multer';
import path from 'path';
import fs from 'fs';
import { fileURLToPath } from 'url';
import { dirname } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Create uploads directory if it doesn't exist
const uploadDir = process.env.UPLOAD_PATH || './uploads';
const createUploadDirs = () => {
  const dirs = [
    uploadDir,
    path.join(uploadDir, 'products'),
    path.join(uploadDir, 'categories'),
    path.join(uploadDir, 'testimonials'),
    path.join(uploadDir, 'manuals')
  ];

  dirs.forEach(dir => {
    if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir, { recursive: true });
    }
  });
};

createUploadDirs();

// Configure storage
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    let folder = 'products';
    
    // Determine folder based on file type or request path
    if (req.originalUrl.includes('category')) {
      folder = 'categories';
    } else if (req.originalUrl.includes('testimonial')) {
      folder = 'testimonials';
    } else if (file.mimetype === 'application/pdf') {
      folder = 'manuals';
    }
    
    cb(null, path.join(uploadDir, folder));
  },
  filename: (req, file, cb) => {
    // Generate unique filename
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    const ext = path.extname(file.originalname);
    const name = file.originalname.replace(ext, '').replace(/[^a-zA-Z0-9]/g, '-');
    cb(null, `${name}-${uniqueSuffix}${ext}`);
  }
});

// File filter for images and PDFs
const fileFilter = (req, file, cb) => {
  const allowedImageTypes = /jpeg|jpg|png|gif|webp/;
  const allowedPdfTypes = /pdf/;
  
  const extname = path.extname(file.originalname).toLowerCase();
  const mimetype = file.mimetype;

  // Check if it's an image
  if (allowedImageTypes.test(extname.slice(1)) && mimetype.startsWith('image/')) {
    cb(null, true);
  }
  // Check if it's a PDF
  else if (allowedPdfTypes.test(extname.slice(1)) && mimetype === 'application/pdf') {
    cb(null, true);
  }
  // Reject file
  else {
    cb(new Error('Only images (JPEG, JPG, PNG, GIF, WEBP) and PDF files are allowed!'), false);
  }
};

// Configure multer
const upload = multer({
  storage: storage,
  limits: {
    fileSize: parseInt(process.env.MAX_FILE_SIZE) || 5 * 1024 * 1024 // 5MB default
  },
  fileFilter: fileFilter
});

// Middleware for single image upload
const uploadSingleImage = upload.single('image');

// Middleware for single PDF upload
const uploadSinglePDF = upload.single('pdf');

// Middleware for multiple images
const uploadMultipleImages = upload.array('images', 5);

// Middleware for product with image and manual
const uploadProductFiles = upload.fields([
  { name: 'image', maxCount: 1 },
  { name: 'manual', maxCount: 1 },
  { name: 'gallery_images', maxCount: 10 }
]);

// Middleware for testimonial with images and video
const uploadTestimonialFiles = upload.fields([
  { name: 'before_image', maxCount: 1 },
  { name: 'after_image', maxCount: 1 }
]);

// Error handling middleware for multer
const handleUploadError = (err, req, res, next) => {
  if (err instanceof multer.MulterError) {
    if (err.code === 'LIMIT_FILE_SIZE') {
      return res.status(400).json({
        success: false,
        message: 'File size too large. Maximum size is 5MB.'
      });
    }
    return res.status(400).json({
      success: false,
      message: `Upload error: ${err.message}`
    });
  } else if (err) {
    return res.status(400).json({
      success: false,
      message: err.message
    });
  }
  next();
};

export {
  uploadSingleImage,
  uploadSinglePDF,
  uploadMultipleImages,
  uploadProductFiles,
  uploadTestimonialFiles,
  handleUploadError
};
