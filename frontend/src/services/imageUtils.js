/**
 * Global utility for handling image URLs
 * Ensures all relative URLs are prefixed with backend base URL
 */

const BACKEND_BASE_URL = (import.meta.env.VITE_API_URL || 'http://localhost:5000/api').replace('/api', '');

/**
 * Get full image URL
 * @param {string} url - The image URL (can be relative or absolute)
 * @returns {string} - Full image URL
 */
export const getImageUrl = (url) => {
  if (!url) return '';
  if (url.startsWith('http')) return url;
  return `${BACKEND_BASE_URL}${url}`;
};

export default getImageUrl;
