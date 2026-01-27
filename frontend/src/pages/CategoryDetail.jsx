import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { Helmet } from 'react-helmet-async';
import { categoryAPI } from '../services/api';
import ProductCard from '../components/browse/ProductCard';
import LoadingSpinner from '../components/common/LoadingSpinner';
import ErrorMessage from '../components/common/ErrorMessage';

const CategoryDetail = () => {
  const { slug } = useParams();
  const [category, setCategory] = useState(null);
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetchCategory();
  }, [slug]);

  const fetchCategory = async () => {
    try {
      setLoading(true);
      setError(null);
      const response = await categoryAPI.getBySlug(slug);
      setCategory(response.data.data);
      setProducts(response.data.data.products || []);
    } catch (err) {
      setError(err.response?.data?.message || 'Failed to load category');
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <LoadingSpinner size="lg" />
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="container-custom">
          <ErrorMessage message={error} onRetry={fetchCategory} />
        </div>
      </div>
    );
  }

  if (!category) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <h2 className="text-2xl font-bold text-gray-900 mb-4">Category Not Found</h2>
          <Link to="/browse" className="btn btn-primary">
            Browse Categories
          </Link>
        </div>
      </div>
    );
  }

  return (
    <>
      <Helmet>
        <title>{category.name} - Sunlink Power</title>
        <meta name="description" content={category.description} />
      </Helmet>

      <div className="min-h-screen bg-gray-50">
        {/* Hero Section */}
        <section 
          className="relative bg-gradient-to-br from-primary-50 to-secondary-50 py-20"
          style={{
            backgroundImage: category.image_url ? `url(${category.image_url})` : 'none',
            backgroundSize: 'cover',
            backgroundPosition: 'center',
          }}
        >
          {category.image_url && (
            <div className="absolute inset-0 bg-gradient-to-r from-black/70 to-black/50" />
          )}
          <div className="container-custom relative">
            <nav className={`flex items-center gap-2 text-sm mb-6 ${category.image_url ? 'text-white/80' : 'text-gray-500'}`}>
              <Link to="/" className={`transition-colors ${category.image_url ? 'hover:text-white' : 'hover:text-primary'}`}>Home</Link>
              <span>/</span>
              <Link to="/browse" className={`transition-colors ${category.image_url ? 'hover:text-white' : 'hover:text-primary'}`}>Products</Link>
              <span>/</span>
              <span className={`font-medium ${category.image_url ? 'text-white' : 'text-gray-900'}`}>{category.name}</span>
            </nav>
            <h1 className={`text-4xl md:text-5xl font-heading font-bold mb-4 ${category.image_url ? 'text-white' : 'text-gray-900'}`}>
              {category.name}
            </h1>
            <p className={`text-lg max-w-2xl ${category.image_url ? 'text-white/90' : 'text-gray-600'}`}>
              {category.description}
            </p>
          </div>
        </section>

        {/* Products Section */}
        <section className="py-16 md:py-24">
          <div className="container-custom">
            {products.length === 0 ? (
              <div className="text-center py-20">
                <p className="text-gray-600 text-lg mb-4">
                  No products found in this category yet.
                </p>
                <Link to="/browse" className="btn btn-primary">
                  Browse Other Categories
                </Link>
              </div>
            ) : (
              <>
                <div className="mb-8">
                  <h2 className="text-2xl font-heading font-bold text-gray-900 mb-2">
                    Available Products
                  </h2>
                  <p className="text-gray-600">
                    {products.length} {products.length === 1 ? 'product' : 'products'} available
                  </p>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                  {products.map((product) => (
                    <ProductCard key={product.id} product={product} />
                  ))}
                </div>
              </>
            )}
          </div>
        </section>
      </div>
    </>
  );
};

export default CategoryDetail;
