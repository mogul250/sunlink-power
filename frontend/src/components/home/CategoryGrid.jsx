import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { FiArrowRight } from 'react-icons/fi';
import { categoryAPI } from '../../services/api';
import { getImageUrl } from '../../services/imageUtils';
import LoadingSpinner from '../common/LoadingSpinner';
import ErrorMessage from '../common/ErrorMessage';

const CategoryGrid = () => {
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetchCategories();
  }, []);

  const fetchCategories = async () => {
    try {
      setLoading(true);
      setError(null);
      const response = await categoryAPI.getAll();
      setCategories(response.data.data.slice(0, 6)); // Show top 6 categories
    } catch (err) {
      setError(err.response?.data?.message || 'Failed to load categories');
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <section className="py-16 md:py-24 bg-gray-50">
        <div className="container-custom">
          <LoadingSpinner size="lg" />
        </div>
      </section>
    );
  }

  if (error) {
    return (
      <section className="py-16 md:py-24 bg-gray-50">
        <div className="container-custom">
          <ErrorMessage message={error} onRetry={fetchCategories} />
        </div>
      </section>
    );
  }

  return (
    <section className="py-16 md:py-24 bg-gray-50">
      <div className="container-custom">
        {/* Section Header */}
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-heading font-bold text-gray-900 mb-4">
            Browse Our Products
          </h2>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto">
            Explore our comprehensive range of solar products designed for African markets
          </p>
        </div>

        {/* Category Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
          {categories.map((category) => (
            <Link
              key={category.id}
              to={`/category/${category.slug}`}
              className="card card-hover group"
            >
              {/* Image */}
              <div className="relative h-48 overflow-hidden">
                <img
                  src={getImageUrl(category.image_url) || 'https://images.unsplash.com/photo-1509391366360-2e959784a276?w=400'}
                  alt={category.name}
                  className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent" />
                
                {/* Category Name Overlay */}
                <div className="absolute bottom-0 left-0 right-0 p-6">
                  <h3 className="text-xl font-heading font-bold text-white mb-1">
                    {category.name}
                  </h3>
                </div>
              </div>

              {/* Content */}
              <div className="p-6">
                <p className="text-gray-600 mb-4 line-clamp-2">
                  {category.description || 'Explore our range of high-quality products'}
                </p>
                <div className="flex items-center text-primary font-medium group-hover:gap-2 transition-all">
                  View Products
                  <FiArrowRight className="ml-2 group-hover:translate-x-1 transition-transform" />
                </div>
              </div>
            </Link>
          ))}
        </div>

        {/* View All Button */}
        <div className="text-center">
          <Link to="/browse" className="inline-flex items-center justify-center gap-2 bg-primary text-white hover:bg-primary/90 rounded-lg text-lg px-8 py-4 transition-all font-bold group">
            View All Categories
            <FiArrowRight className="group-hover:translate-x-1 transition-transform" />
          </Link>
        </div>
      </div>
    </section>
  );
};

export default CategoryGrid;
