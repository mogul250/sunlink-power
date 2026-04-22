import { useState, useEffect } from 'react';
import { Helmet } from 'react-helmet-async';
import { categoryAPI } from '../services/api';
import CategoryCard from '../components/browse/CategoryCard';
import LoadingSpinner from '../components/common/LoadingSpinner';
import ErrorMessage from '../components/common/ErrorMessage';

const Browse = () => {
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
      setCategories(response.data.data);
    } catch (err) {
      setError(err.response?.data?.message || 'Failed to load categories');
    } finally {
      setLoading(false);
    }
  };

  return (
    <>
      <Helmet>
        <title>Browse Products - Sunlink Power</title>
        <meta
          name="description"
          content="Browse our complete range of solar products including panels, inverters, batteries, and complete solar kits for homes and businesses."
        />
      </Helmet>

      <div className="min-h-screen bg-gray-50">
        {/* Hero Section */}
        <section className="bg-gradient-to-br from-primary-50 to-secondary-50 py-16">
          <div className="container-custom">
            <div className="max-w-3xl">
              <h1 className="text-4xl md:text-5xl font-heading font-bold text-gray-900 mb-4">
                Browse Our Products
              </h1>
              <p className="text-lg text-gray-600">
                Explore our comprehensive range of premium solar products designed 
                specifically for African markets. Quality, reliability, and affordability guaranteed.
              </p>
            </div>
          </div>
        </section>

        {/* Categories Section */}
        <section className="section-padding">
          <div className="container-custom">
            {loading ? (
              <LoadingSpinner size="lg" className="py-20" />
            ) : error ? (
              <ErrorMessage message={error} onRetry={fetchCategories} />
            ) : categories.length === 0 ? (
              <div className="text-center py-20">
                <p className="text-gray-600 text-lg">No categories found</p>
              </div>
            ) : (
              <>
                <div className="mb-8">
                  <h2 className="text-2xl font-heading font-bold text-gray-900 mb-2">
                    Product Categories
                  </h2>
                  <p className="text-gray-600">
                    {categories.length} categories available
                  </p>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                  {categories.map((category) => (
                    <CategoryCard key={category.id} category={category} />
                  ))}
                </div>
              </>
            )}
          </div>
        </section>

        {/* CTA Section */}
        <section className="bg-gradient-to-r from-primary to-secondary py-16">
          <div className="container-custom text-center">
            <h2 className="text-3xl md:text-4xl font-heading font-bold text-white mb-4">
              Need Help Choosing?
            </h2>
            <p className="text-white/90 text-lg mb-8 max-w-2xl mx-auto">
              Our solar experts are here to help you find the perfect solution for your needs
            </p>
            <a
              href="https://wa.me/+8618617384878?text=Hi%20Sunlink%2C%20I%20need%20help%20choosing%20the%20right%20solar%20products"
              target="_blank"
              rel="noopener noreferrer"
              className="btn bg-white text-primary hover:bg-gray-100 text-lg"
            >
              Chat with Expert
            </a>
          </div>
        </section>
      </div>
    </>
  );
};

export default Browse;
