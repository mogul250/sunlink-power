import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { Helmet } from 'react-helmet-async';
import { FiCheck, FiDownload, FiMessageCircle, FiPlay } from 'react-icons/fi';
import { productAPI } from '../services/api';
import LoadingSpinner from '../components/common/LoadingSpinner';
import ErrorMessage from '../components/common/ErrorMessage';

const ProductDetail = () => {
  const { id } = useParams();
  const [product, setProduct] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [activeImage, setActiveImage] = useState(null);

  useEffect(() => {
    fetchProduct();
  }, [id]);

  const fetchProduct = async () => {
    try {
      setLoading(true);
      setError(null);
      const response = await productAPI.getById(id);
      setProduct(response.data.data);
      setActiveImage(response.data.data.image_url);
    } catch (err) {
      setError(err.response?.data?.message || 'Failed to load product');
    } finally {
      setLoading(false);
    }
  };

  const getEmbedUrl = (url) => {
    if (!url) return null;
    // Handle standard YouTube URLs to convert to embed format
    const regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|&v=)([^#&?]*).*/;
    const match = url.match(regExp);
    return (match && match[2]) ? `https://www.youtube.com/embed/${match[2].trim()}` : null;
  };

  if (loading) return <div className="min-h-screen flex items-center justify-center"><LoadingSpinner size="lg" /></div>;
  if (error) return <div className="min-h-screen flex items-center justify-center"><ErrorMessage message={error} onRetry={fetchProduct} /></div>;
  if (!product) return <div className="min-h-screen flex items-center justify-center">Product not found</div>;

  const embedUrl = getEmbedUrl(product.video_url);

  // Helper to get full image URL
  const getImageUrl = (url) => {
    if (!url) return '';
    if (url.startsWith('http')) return url;
    const baseUrl = (import.meta.env.VITE_API_URL || 'http://localhost:5000/api').replace(/\/api$/, '');
    return `${baseUrl}${url}`;
  };

  return (
    <>
      <Helmet>
        <title>{product.name} - Sunlink Power</title>
        <meta name="description" content={product.description} />
      </Helmet>

      <div className="min-h-screen bg-gray-50 py-12">
        <div className="container mx-auto px-4 max-w-[1440px]">
          <nav className="flex items-center gap-2 text-sm text-gray-500 mb-8">
            <Link to="/" className="hover:text-primary transition-colors">Home</Link>
            <span className="text-gray-400">/</span>
            <Link to="/browse" className="hover:text-primary transition-colors">Products</Link>
            {product.category_name && (
              <>
                <span className="text-gray-400">/</span>
                <span className="text-gray-600">{product.category_name}</span>
              </>
            )}
            <span className="text-gray-400">/</span>
            <span className="text-gray-900 font-medium truncate max-w-[200px] sm:max-w-md">{product.name}</span>
          </nav>

          <div className="bg-white rounded-2xl shadow-sm overflow-hidden">
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-0">
              {/* Image Gallery */}
              <div className="bg-gray-50 h-full flex flex-col">
                <div className="aspect-square bg-white overflow-hidden shadow-sm relative">
                  <img src={getImageUrl(activeImage || product.image_url)} alt={product.name} className="w-full h-full object-cover px-8" />
                </div>

                {/* Thumbnail Gallery */}
                {(product.gallery_images && product.gallery_images.length > 0) && (
                  <div className="grid grid-cols-5 gap-2 p-4">
                    {/* Main Image Thumbnail */}
                    <button 
                      onClick={() => setActiveImage(product.image_url)}
                      className={`aspect-square rounded-lg overflow-hidden border-2 transition-colors ${activeImage === product.image_url ? 'border-primary' : 'border-transparent hover:border-gray-200'}`}
                    >
                      <img src={getImageUrl(product.image_url)} alt="Main" className="w-full h-full object-cover" />
                    </button>
                    {/* Gallery Thumbnails */}
                    {product.gallery_images.map((img) => (
                      <button 
                        key={img.id}
                        onClick={() => setActiveImage(img.image_url)}
                        className={`aspect-square rounded-lg overflow-hidden border-2 transition-colors ${activeImage === img.image_url ? 'border-primary' : 'border-transparent hover:border-gray-200'}`}
                      >
                        <img src={getImageUrl(img.image_url)} alt="Gallery" className="w-full h-full object-cover" />
                      </button>
                    ))}
                  </div>
                )}
              </div>

              {/* Product Info */}
              <div className="p-8 lg:p-12">
                <div className="mb-2 text-primary font-medium">{product.category_name}</div>
                <h1 className="text-3xl md:text-4xl font-heading font-bold text-gray-900 mb-4">{product.name}</h1>
                
                <div className="flex items-baseline gap-4 mb-6">
                  <span className="text-3xl font-bold text-gray-900">${product.price}</span>
                  <span className={`px-3 py-1 rounded-full text-sm font-medium ${
                    product.stock_status === 'in_stock' ? 'bg-green-100 text-green-700' : 'bg-orange-100 text-orange-700'
                  }`}>
                    {product.stock_status === 'in_stock' ? 'In Stock' : 'Pre-order'}
                  </span>
                </div>

                {/* Key Features */}
                <div className="grid grid-cols-2 gap-4 mb-8">
                  {product.wattage && (
                    <div className="bg-gray-50 p-4 rounded-lg">
                      <div className="text-sm text-gray-500 mb-1">Power Output</div>
                      <div className="font-semibold text-gray-900">{product.wattage}</div>
                    </div>
                  )}
                  {product.warranty_info && (
                    <div className="bg-gray-50 p-4 rounded-lg">
                      <div className="text-sm text-gray-500 mb-1">Warranty</div>
                      <div className="font-semibold text-gray-900">{product.warranty_info}</div>
                    </div>
                  )}
                  {product.battery_type && product.battery_type !== 'N/A' && (
                    <div className="bg-gray-50 p-4 rounded-lg">
                      <div className="text-sm text-gray-500 mb-1">Battery Type</div>
                      <div className="font-semibold text-gray-900">{product.battery_type}</div>
                    </div>
                  )}
                  {product.durability_rating && (
                    <div className="bg-gray-50 p-4 rounded-lg">
                      <div className="text-sm text-gray-500 mb-1">Durability</div>
                      <div className="font-semibold text-gray-900">{product.durability_rating}</div>
                    </div>
                  )}
                </div>

                <p className="text-gray-600 text-lg mb-8 leading-relaxed">{product.description}</p>

                {/* Actions */}
                <div className="flex flex-col sm:flex-row gap-4 mb-8">
                  <a 
                    href={`https://wa.me/+8613800000000?text=Hi%20Sunlink,%20I'm%20interested%20in%20${encodeURIComponent(product.name)}`}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="btn btn-primary flex-1 flex items-center justify-center gap-2"
                  >
                    <FiMessageCircle /> Inquire on WhatsApp
                  </a>
                  {product.manual_pdf_url && (
                    <a 
                      href={product.manual_pdf_url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="btn bg-white border border-gray-200 text-gray-700 hover:bg-gray-50 flex-1 flex items-center justify-center gap-2"
                    >
                      <FiDownload /> Download Manual
                    </a>
                  )}
                </div>
              </div>
            </div>

            {/* Video Section */}
            {embedUrl && (
              <div className="border-t border-gray-100 p-8 lg:p-12">
                <h2 className="text-2xl font-heading font-bold text-gray-900 mb-6 flex items-center gap-2">
                  <FiPlay className="text-primary" /> Product Video
                </h2>
                <div className="aspect-video w-full max-w-4xl mx-auto rounded-xl overflow-hidden shadow-lg bg-black">
                  <iframe
                    src={embedUrl}
                    title={product.name}
                    className="w-full h-full"
                    frameBorder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowFullScreen
                  />
                </div>
              </div>
            )}

            {/* Technical Specifications Table */}
            {product.metadata && (
              <div className="border-t border-gray-100 p-8 lg:p-12 bg-gray-50">
                <h2 className="text-2xl font-heading font-bold text-gray-900 mb-6">Technical Specifications</h2>
                <div className="bg-white rounded-xl shadow-sm overflow-hidden max-w-4xl">
                  <table className="w-full">
                    <tbody className="divide-y divide-gray-100">
                      {Object.entries(typeof product.metadata === 'string' ? JSON.parse(product.metadata) : product.metadata).map(([key, value]) => (
                        <tr key={key} className="hover:bg-gray-50">
                          <td className="px-6 py-4 text-sm font-medium text-gray-500 capitalize w-1/3">
                            {key.replace(/_/g, ' ')}
                          </td>
                          <td className="px-6 py-4 text-sm text-gray-900">
                            {Array.isArray(value) ? value.join(', ') : value.toString()}
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>
            )}
          </div>
        </div>
      </div>
    </>
  );
};

export default ProductDetail;