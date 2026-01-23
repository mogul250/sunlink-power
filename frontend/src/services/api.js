import axios from 'axios';

// Create axios instance with default config
const api = axios.create({
  baseURL: import.meta.env.VITE_API_URL || 'http://localhost:5000/api',
  timeout: 10000,
  headers: {
    'Content-Type': 'application/json',
  },
});

// Request interceptor to add auth token
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('adminToken');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// Response interceptor for error handling
api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      // Unauthorized - clear token and redirect to login
      localStorage.removeItem('adminToken');
      localStorage.removeItem('adminUser');
      if (window.location.pathname.startsWith('/admin') && window.location.pathname !== '/admin/login') {
        window.location.href = '/admin/login';
      }
    }
    return Promise.reject(error);
  }
);

// ============================================
// Category API
// ============================================
export const categoryAPI = {
  getAll: () => api.get('/categories'),
  getBySlug: (slug) => api.get(`/categories/${slug}`),
  create: (data) => api.post('/categories', data),
  update: (id, data) => api.put(`/categories/${id}`, data),
  delete: (id) => api.delete(`/categories/${id}`),
};

// ============================================
// Product API
// ============================================
export const productAPI = {
  getAll: (params) => api.get('/products', { params }),
  getById: (id) => api.get(`/products/${id}`),
  getByCategory: (categoryId) => api.get(`/products/category/${categoryId}`),
  create: (data) => api.post('/products', data),
  update: (id, data) => api.put(`/products/${id}`, data),
  delete: (id) => api.delete(`/products/${id}`),
};

// ============================================
// Testimonial API
// ============================================
export const testimonialAPI = {
  getApproved: (params) => api.get('/testimonials', { params }),
  getAll: (params) => api.get('/testimonials/all', { params }),
  getById: (id) => api.get(`/testimonials/${id}`),
  create: (data) => api.post('/testimonials', data),
  approve: (id) => api.put(`/testimonials/${id}/approve`),
  unapprove: (id) => api.put(`/testimonials/${id}/unapprove`),
  update: (id, data) => api.put(`/testimonials/${id}`, data),
  delete: (id) => api.delete(`/testimonials/${id}`),
};

// ============================================
// Admin API
// ============================================
export const adminAPI = {
  login: (credentials) => api.post('/admin/login', credentials),
  register: (data) => api.post('/admin/register', data),
  getProfile: () => api.get('/admin/profile'),
  updateProfile: (data) => api.put('/admin/profile', data),
  getAllAdmins: () => api.get('/admin/users'),
  updateAdminStatus: (id, data) => api.put(`/admin/users/${id}/status`, data),
  deleteAdmin: (id) => api.delete(`/admin/users/${id}`),
};

// ============================================
// File Upload Helper
// ============================================
export const uploadFile = async (file, type = 'image') => {
  const formData = new FormData();
  formData.append(type, file);
  
  const response = await api.post('/upload', formData, {
    headers: {
      'Content-Type': 'multipart/form-data',
    },
  });
  
  return response.data;
};

// ============================================
// WhatsApp Helper
// ============================================
export const generateWhatsAppLink = (productName) => {
  const phoneNumber = import.meta.env.VITE_WHATSAPP_NUMBER || '+8613800000000';
  const message = `Hi Sunlink, I'm interested in ${productName}`;
  const encodedMessage = encodeURIComponent(message);
  return `https://wa.me/${phoneNumber}?text=${encodedMessage}`;
};

export default api;
