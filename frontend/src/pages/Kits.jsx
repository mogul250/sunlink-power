import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { FiSearch } from 'react-icons/fi';
import KitCard from '../components/browse/KitCard';
import { kitAPI } from '../services/api.js';
import { getImageUrl } from '../services/imageUtils';
import LoadingSpinner from '../components/common/LoadingSpinner';

const Kits = () => {
  const [kits, setKits] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [searchTerm, setSearchTerm] = useState('');

  useEffect(() => {
    fetchKits();
  }, []);

  const fetchKits = async () => {
    try {
      setLoading(true);
      setError(null);
      
      
      const response = await kitAPI.getAll();
      setKits(response.data.data || []);
    } catch (err) {
      setError('Failed to load kits. Please try again.');
    } finally {
      setLoading(false);
    }
  };

  const filteredKits = kits.filter(kit =>
    kit.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    kit.description?.toLowerCase().includes(searchTerm.toLowerCase())
  );

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 py-20">
        <div className="container-custom">
          <div className="text-center">
            <LoadingSpinner size="lg" />
            <p className="mt-4 text-gray-600">Loading kits...</p>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero Section */}
      <div className="bg-gradient-to-r from-blue-600 to-indigo-700 text-white py-20">
        <div className="container-custom text-center">
          <h1 className="text-4xl md:text-5xl font-heading font-bold mb-6">
            Complete Solar Kits
          </h1>
          <p className="text-xl md:text-2xl mb-8 max-w-3xl mx-auto leading-relaxed">
            Pre-configured solar power solutions for homes, businesses, and off-grid applications.
            Everything you need in one package.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center items-center max-w-md mx-auto">
            <Link
              to="#kits"
              className="btn btn-light px-8 py-3 text-lg font-semibold"
            >
              Browse Kits
            </Link>
            <a
              href="https://wa.me/+8618617384878?text=Hi%20Sunlink%2C%20I'm%20interested%20in%20solar%20kits"
              target="_blank"
              rel="noopener noreferrer"
              className="btn btn-primary px-8 py-3 text-lg font-semibold"
            >
              Get Custom Quote
            </a>
          </div>
        </div>
      </div>

      {/* Search & Filters */}
      <div className="container-custom py-12">
        <div className="flex flex-col lg:flex-row gap-4 items-center justify-between mb-12">
          <div className="flex-1 max-w-md">
            <div className="relative">
              <FiSearch className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
              <input
                type="text"
                placeholder="Search kits by name or description..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="w-full pl-12 pr-4 py-3 border border-gray-200 rounded-xl focus:ring-2 focus:ring-primary focus:border-transparent transition-all"
              />
            </div>
          </div>
          <div className="flex gap-2 text-sm">
            <button className="px-4 py-2 bg-primary text-white rounded-lg font-medium">
              All Kits ({filteredKits.length})
            </button>
            <button className="px-4 py-2 border border-gray-200 text-gray-700 hover:bg-gray-50 rounded-lg font-medium transition-colors">
              Featured
            </button>
            <button className="px-4 py-2 border border-gray-200 text-gray-700 hover:bg-gray-50 rounded-lg font-medium transition-colors">
              Residential
            </button>
          </div>
        </div>

        {error && (
          <div className="text-center py-20">
            <div className="text-red-600 mb-4">{error}</div>
            <button
              onClick={fetchKits}
              className="btn btn-primary"
            >
              Try Again
            </button>
          </div>
        )}

        {/* Kits Grid */}
        <div id="kits" className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
          {filteredKits.length > 0 ? (
            filteredKits.map((kit) => (
              <KitCard key={kit.id} kit={kit} />
            ))
          ) : (
            <div className="col-span-full text-center py-20">
              <div className="text-6xl text-gray-300 mb-4">📦</div>
              <h3 className="text-2xl font-bold text-gray-900 mb-2">No kits found</h3>
              <p className="text-gray-600 mb-8 max-w-md mx-auto">
                {searchTerm ? 'Try a different search term' : 'No kits available right now'}
              </p>
              <Link to="/browse" className="btn btn-primary">
                Browse Products Instead
              </Link>
            </div>
          )}
        </div>

        {kits.length > 12 && (
          <div className="text-center mt-16">
            <Link to="/kits" className="btn btn-outline-primary px-8 py-3 text-lg">
              Load More Kits
            </Link>
          </div>
        )}
      </div>
    </div>
  );
};

export default Kits;

