import { useState, useEffect } from 'react';
import { Link, useLocation } from 'react-router-dom';
import { FiMenu, FiX, FiSun } from 'react-icons/fi';
import logo from '../../assets/logo.png';

const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const [isScrolled, setIsScrolled] = useState(false);
  const location = useLocation();

  useEffect(() => {
    const handleScroll = () => {
      setIsScrolled(window.scrollY > 0);
    };

    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const navigation = [
    { name: 'Home', path: '/' },
    { name: 'Products', path: '/browse' },
    { name: 'About Us', path: '/about' },
    { name: 'Contact', path: '/contact' },
  ];

  const isActive = (path) => {
    return location.pathname === path;
  };

  return (
    <header className={`bg-white sticky top-0 z-50 transition-shadow duration-300 ${isScrolled ? 'shadow-md' : ''}`}>
      <nav className="container-custom">
        <div className="flex items-center justify-between h-16 md:h-20">
          {/* Logo */}
          <Link to="/" className="flex items-center gap-2 group">
            <img className="w-[180px] h-auto object-contain group-hover:scale-105 transition-transform" src={logo} alt="Sunlink Power" />
          </Link>

          {/* Desktop Navigation */}
          <div className="hidden md:flex items-center gap-8">
            {navigation.map((item) => (
              <Link
                key={item.path}
                to={item.path}
                className={`text-base font-medium transition-colors relative group ${
                  isActive(item.path)
                    ? 'text-primary'
                    : 'text-gray-700 hover:text-primary'
                }`}
              >
                {item.name}
                <span
                  className={`absolute -bottom-1 left-0 w-full h-0.5 bg-primary transform origin-left transition-transform ${
                    isActive(item.path) ? 'scale-x-100' : 'scale-x-0 group-hover:scale-x-100'
                  }`}
                />
              </Link>
            ))}
          </div>

          {/* CTA Button - Desktop */}
          <div className="hidden md:block">
            <a
              href="https://wa.me/+8613800000000?text=Hi%20Sunlink%2C%20I%27m%20interested%20in%20your%20solar%20products"
              target="_blank"
              rel="noopener noreferrer"
              className="btn btn-primary"
            >
              Get Quote
            </a>
          </div>

          {/* Mobile Menu Button */}
          <button
            onClick={() => setIsMenuOpen(!isMenuOpen)}
            className="md:hidden p-2 rounded-lg hover:bg-gray-100 transition-colors"
            aria-label="Toggle menu"
          >
            {isMenuOpen ? (
              <FiX className="w-6 h-6 text-gray-900" />
            ) : (
              <FiMenu className="w-6 h-6 text-gray-900" />
            )}
          </button>
        </div>

        {/* Mobile Navigation */}
        {isMenuOpen && (
          <div className="md:hidden py-4 border-t border-gray-200 animate-slide-down">
            <div className="flex flex-col gap-4">
              {navigation.map((item) => (
                <Link
                  key={item.path}
                  to={item.path}
                  onClick={() => setIsMenuOpen(false)}
                  className={`px-4 py-2 rounded-lg font-medium transition-colors ${
                    isActive(item.path)
                      ? 'bg-primary text-white'
                      : 'text-gray-700 hover:bg-gray-100'
                  }`}
                >
                  {item.name}
                </Link>
              ))}
              <a
                href="https://wa.me/+8613800000000?text=Hi%20Sunlink%2C%20I%27m%20interested%20in%20your%20solar%20products"
                target="_blank"
                rel="noopener noreferrer"
                className="btn btn-primary w-full"
                onClick={() => setIsMenuOpen(false)}
              >
                Get Quote
              </a>
            </div>
          </div>
        )}
      </nav>
    </header>
  );
};

export default Header;
