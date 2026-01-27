import axios from 'axios';

// Use environment variable or default to localhost
const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000/api';

const adminApi = axios.create({
  baseURL: API_URL,
  timeout: 60000, // 1 minute timeout
});

// Add auth token to requests
adminApi.interceptors.request.use((config) => {
  const token = localStorage.getItem('adminToken');
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

export const authAPI = {
  login: (credentials) => adminApi.post('/admin/login', credentials),
  getProfile: () => adminApi.get('/admin/profile'),
};

export const productAPI = {
  getAll: (params) => adminApi.get('/products', { params }),
  getById: (id) => adminApi.get(`/products/${id}`),
  create: (formData) => adminApi.post('/products', formData, {
    headers: { 'Content-Type': 'multipart/form-data' },
  }),
  update: (id, formData) => adminApi.put(`/products/${id}`, formData, {
    headers: { 'Content-Type': 'multipart/form-data' },
  }),
  delete: (id) => adminApi.delete(`/products/${id}`),
  deleteImage: (id) => adminApi.delete(`/products/images/${id}`),
};

export const categoryAPI = {
  getAll: () => adminApi.get('/categories'),
  getById: (id) => adminApi.get(`/categories/${id}`),
  create: (formData) => adminApi.post('/categories', formData, {
    headers: { 'Content-Type': 'multipart/form-data' },
  }),
  update: (id, formData) => adminApi.put(`/categories/${id}`, formData, {
    headers: { 'Content-Type': 'multipart/form-data' },
  }),
  delete: (id) => adminApi.delete(`/categories/${id}`),
};

export const testimonialAPI = {
  getAll: () => adminApi.get('/testimonials/all'),
  approve: (id) => adminApi.put(`/testimonials/${id}/approve`),
  delete: (id) => adminApi.delete(`/testimonials/${id}`),
};

export default adminApi;