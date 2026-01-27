import axios from 'axios';

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000/api';

const api = axios.create({
  baseURL: API_URL,
  timeout: 60000, // 1 minute timeout
});

export const productAPI = {
  getAll: (params) => api.get('/products', { params }),
  getById: (id) => api.get(`/products/${id}`),
  getByCategory: (categoryId) => api.get(`/products/category/${categoryId}`),
};

export const categoryAPI = {
  getAll: () => api.get('/categories'),
  getBySlug: (slug) => api.get(`/categories/${slug}`),
};

export const testimonialAPI = {
  getApproved: (params) => api.get('/testimonials', { params }),
  create: (formData) => api.post('/testimonials', formData, {
    headers: { 'Content-Type': 'multipart/form-data' },
  }),
};

// Helper for WhatsApp link
export const generateWhatsAppLink = (productName) => {
  const phone = '+8613800000000'; // Replace with real number
  const text = `Hi Sunlink, I'm interested in ${productName}`;
  return `https://wa.me/${phone}?text=${encodeURIComponent(text)}`;
};

export default api;