import { Link } from 'react-router-dom';
import { FiArrowRight } from 'react-icons/fi';

const CategoryCard = ({ category }) => {
  return (
    <Link
      to={`/category/${category.slug}`}
      className="card card-hover group overflow-hidden"
    >
      {/* Image */}
      <div className="relative h-56 overflow-hidden">
        <img
          src={category.image_url || 'https://images.unsplash.com/photo-1509391366360-2e959784a276?w=600'}
          alt={category.name}
          className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
          loading="lazy"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-black/20 to-transparent" />
        
        {/* Category Name Overlay */}
        <div className="absolute bottom-0 left-0 right-0 p-6">
          <h3 className="text-2xl font-heading font-bold text-white mb-2">
            {category.name}
          </h3>
        </div>
      </div>

      {/* Content */}
      <div className="p-6">
        <p className="text-gray-600 mb-4 line-clamp-2 min-h-[3rem]">
          {category.description || 'Explore our range of high-quality products'}
        </p>
        
        <div className="flex items-center justify-between">
          <span className="text-sm text-gray-500">
            View Products
          </span>
          <div className="w-10 h-10 rounded-full bg-primary-100 flex items-center justify-center group-hover:bg-primary group-hover:scale-110 transition-all">
            <FiArrowRight className="w-5 h-5 text-primary group-hover:text-white transition-colors" />
          </div>
        </div>
      </div>
    </Link>
  );
};

export default CategoryCard;
