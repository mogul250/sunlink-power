import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { Helmet } from 'react-helmet-async';
import { FiDownload, FiZap, FiShield, FiPackage, FiCheck, FiArrowLeft } from 'react-icons/fi';
import { FaWhatsapp } from 'react-icons/fa';
import { productAPI, generateWhatsAppLink } from '../services/api';
import LoadingSpinner from '../components/common/LoadingSpinner';
import ErrorMessage from '../components/common/ErrorMessage';

const ProductDetail = () => {
  const { id } = useParams();
  const [product, setProduct] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetchProduct();
  }, [id]);

  const fetchProduct = async () => {
    try {
      setLoading(true);
      setError(null);
      const response = await productAPI.getById(id);
      setProduct(response.data.data);
    } catch (err) {
      setError(err.response?.data?.message || 'Failed to load product');
    } finally {
      setLoading(false);
    }
  };

  const handleWhatsAppClick = () => {
    const link = generateWhatsAppLink(product.name);
    window.open(link, '_blank', 'noopener,noreferrer');
  };

  const handleDownloadManual = () => {
    if (product.manual_pdf_url) {
      window.open(product.manual_pdf_url, '_blank');
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
          <ErrorMessage message={error} onRetry={fetchProduct} />
        </div>
      </div>
    );
  }

  if (!product) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <h2 className="text-2xl font-bold text-gray-900 mb-4">Product Not Found</h2>
          <Link to="/browse" className="btn btn-primary">
            Browse Products
          </Link>
        </div>
      </div>
    );
  }

  const metadata = typeof product.metadata === 'string' 
    ? JSON.parse(product.metadata) 
    : product.metadata;

  return (
    <>
      <Helmet>
        <title>{product.name} - Sunlink Power</title>
        <meta name="description" content={product.description} />
      </Helmet>

      <div className="min-h-screen bg-gray-50">
        {/* Breadcrumb */}
        <div className="bg-white border-b border-gray-200">
          <div className="container-custom py-4">
            <div className="flex items-center gap-2 text-sm text-gray-600">
              <Link to="/" className="hover:text-primary">Home</Link>
              <span>/</span>
              <Link to="/browse" className="hover:text-primary">Browse</Link>
              {product.category_name && (
                <>
                  <span>/</span>
                  <Link to={`/category/${product.category_slug}`} className="hover:text-primary">
                    {product.category_name}
                  </Link>
                </>
              )}
              <span>/</span>
              <span className="text-gray-900 font-medium">{product.name}</span>
            </div>
          </div>
        </div>

        {/* Product Details */}
        <section className="py-16 md:py-24">
          <div className="container-custom">
            <Link to="/browse" className="inline-flex items-center gap-2 text-primary hover:text-primary-600 mb-8">
              <FiArrowLeft />
              Back to Browse
            </Link>

            <div className="grid lg:grid-cols-2 gap-12">
              {/* Image Gallery */}
              <div className="space-y-4">
                <div className="card overflow-hidden">
                  <img
                    src={product.image_url || 'https://images.unsplash.com/photo-1509391366360-2e959784a276?w=800'}
                    alt={product.name}
                    className="w-full h-auto"
                  />
                </div>
                {product.is_featured && (
                  <div className="flex items-center gap-2 text-accent">
                    <FiCheck className="w-5 h-5" />
                    <span className="font-medium">Featured Product</span>
                  </div>
                )}
              </div>

              {/* Product Info */}
              <div className="space-y-6">
                {/* Category Badge */}
                {product.category_name && (
                  <span className="inline-block px-4 py-2 bg-primary-100 text-primary font-medium rounded-full text-sm">
                    {product.category_name}
                  </span>
                )}

                {/* Product Name */}
                <h1 className="text-3xl md:text-4xl font-heading font-bold text-gray-900">
                  {product.name}
                </h1>

                {/* Price */}
                <div className="flex items-baseline gap-4">
                  <div className="text-4xl font-bold text-gray-900">
                    ${product.price}
                  </div>
                  <div className="text-gray-500">USD</div>
                </div>

                {/* Key Features */}
                <div className="grid grid-cols-2 gap-4">
                  {product.wattage && (
                    <div className="flex items-center gap-3 p-4 bg-white rounded-lg border border-gray-200">
                      <FiZap className="w-6 h-6 text-primary" />
                      <div>
                        <div className="text-sm text-gray-600">Power</div>
                        <div className="font-semibold text-gray-900">{product.wattage}</div>
                      </div>
                    </div>
                  )}
                  {product.warranty_info && (
                    <div className="flex items-center gap-3 p-4 bg-white rounded-lg border border-gray-200">
                      <FiShield className="w-6 h-6 text-secondary" />
                      <div>
                        <div className="text-sm text-gray-600">Warranty</div>
                        <div className="font-semibold text-gray-900">{product.warranty_info.split(',')[0]}</div>
                      </div>
                    </div>
                  )}
                  {product.stock_status && (
                    <div className="flex items-center gap-3 p-4 bg-white rounded-lg border border-gray-200">
                      <FiPackage className="w-6 h-6 text-accent" />
                      <div>
                        <div className="text-sm text-gray-600">Stock</div>
                        <div className="font-semibold text-gray-900 capitalize">
                          {product.stock_status.replace('_', ' ')}
                        </div>
                      </div>
                    </div>
                  )}
                </div>

                {/* Description */}
                <div>
                  <h3 className="text-lg font-heading font-bold text-gray-900 mb-2">
                    Description
                  </h3>
                  <p className="text-gray-600 leading-relaxed">
                    {product.description}
                  </p>
                </div>

                {/* Action Buttons */}
                <div className="flex flex-col sm:flex-row gap-4 pt-4">
                  <button
                    onClick={handleWhatsAppClick}
                    className="btn bg-green-500 hover:bg-green-600 text-white flex-1 text-lg"
                  >
                    <FaWhatsapp className="w-5 h-5" />
                    Chat on WhatsApp
                  </button>
                  {product.manual_pdf_url && (
                    <button
                      onClick={handleDownloadManual}
                      className="btn btn-outline flex-1 text-lg"
                    >
                      <FiDownload className="w-5 h-5" />
                      Download Manual
                    </button>
                  )}
                </div>
              </div>
            </div>

            {/* Technical Specifications */}
            {metadata && Object.keys(metadata).length > 0 && (
              <div className="mt-16">
                <h2 className="text-2xl font-heading font-bold text-gray-900 mb-6">
                  Technical Specifications
                </h2>
                <div className="card overflow-hidden">
                  <table className="w-full">
                    <tbody className="divide-y divide-gray-200">
                      {Object.entries(metadata).map(([key, value]) => (
                        <tr key={key} className="hover:bg-gray-50">
                          <td className="px-6 py-4 text-sm font-medium text-gray-900 capitalize w-1/3">
                            {key.replace(/_/g, ' ')}
                          </td>
                          <td className="px-6 py-4 text-sm text-gray-600">
                            {Array.isArray(value) ? value.join(', ') : value}
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>
            )}
          </div>
        </section>
      </div>
    </>
  );
};

export default ProductDetail;
