import { Link } from 'react-router-dom';
import { FiShoppingCart, FiZap, FiAward } from 'react-icons/fi';
import { FaWhatsapp } from 'react-icons/fa';
import { generateWhatsAppLink } from '../../services/api';

const ProductCard = ({ product }) => {
  const handleWhatsAppClick = (e) => {
    e.preventDefault();
    const link = generateWhatsAppLink(product.name);
    window.open(link, '_blank', 'noopener,noreferrer');
  };

  return (
    <div className="card card-hover group">
      {/* Image */}
      <Link to={`/product/${product.id}`} className="block relative h-56 overflow-hidden">
        <img
          src={product.image_url || 'https://images.unsplash.com/photo-1509391366360-2e959784a276?w=400'}
          alt={product.name}
          className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
          loading="lazy"
        />
        
        {/* Badges */}
        <div className="absolute top-3 left-3 flex flex-col gap-2">
          {product.is_featured && (
            <span className="px-3 py-1 bg-accent text-white text-xs font-semibold rounded-full flex items-center gap-1">
              <FiAward className="w-3 h-3" />
              Featured
            </span>
          )}
          {product.stock_status === 'in_stock' && (
            <span className="px-3 py-1 bg-primary text-white text-xs font-semibold rounded-full">
              In Stock
            </span>
          )}
        </div>
      </Link>

      {/* Content */}
      <div className="p-5">
        {/* Category */}
        {product.category_name && (
          <span className="text-xs font-medium text-primary uppercase tracking-wide">
            {product.category_name}
          </span>
        )}

        {/* Product Name */}
        <Link to={`/product/${product.id}`}>
          <h3 className="text-lg font-heading font-bold text-gray-900 mt-2 mb-2 line-clamp-2 min-h-[3.5rem] group-hover:text-primary transition-colors">
            {product.name}
          </h3>
        </Link>

        {/* Description */}
        <p className="text-sm text-gray-600 mb-4 line-clamp-2 min-h-[2.5rem]">
          {product.description}
        </p>

        {/* Specs */}
        <div className="flex items-center gap-4 mb-4 text-sm text-gray-600">
          {product.wattage && (
            <div className="flex items-center gap-1">
              <FiZap className="w-4 h-4 text-primary" />
              <span>{product.wattage}</span>
            </div>
          )}
          {product.warranty_info && (
            <div className="flex items-center gap-1">
              <FiAward className="w-4 h-4 text-secondary" />
              <span className="text-xs">{product.warranty_info.split(',')[0]}</span>
            </div>
          )}
        </div>

        {/* Price & Actions */}
        <div className="flex items-center justify-between pt-4 border-t border-gray-200">
          <div>
            <div className="text-2xl font-bold text-gray-900">
              ${product.price}
            </div>
            <div className="text-xs text-gray-500">USD</div>
          </div>

          <div className="flex items-center gap-2">
            <Link
              to={`/product/${product.id}`}
              className="btn btn-outline py-2 px-4 text-sm"
            >
              <FiShoppingCart className="w-4 h-4" />
              Details
            </Link>
            <button
              onClick={handleWhatsAppClick}
              className="btn bg-green-500 hover:bg-green-600 text-white py-2 px-4 text-sm"
              title="Chat on WhatsApp"
            >
              <FaWhatsapp className="w-4 h-4" />
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ProductCard;
