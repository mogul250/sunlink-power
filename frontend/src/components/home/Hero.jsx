import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { FiArrowRight, FiPlay } from 'react-icons/fi';

const Hero = () => {
  const [currentImageIndex, setCurrentImageIndex] = useState(0);
  
  const images = [
    'https://images.unsplash.com/photo-1509391366360-2e959784a276?w=1600', // Solar Farm
    'https://images.unsplash.com/photo-1497440001374-f26997328c1b?w=1600', // Installation
    'https://images.unsplash.com/photo-1545209463-ce23922ce71e?w=1600'  // Panels
  ];

  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentImageIndex((prev) => (prev + 1) % images.length);
    }, 5000);
    return () => clearInterval(interval);
  }, []);

  return (
    <section className="relative h-screen w-full overflow-hidden bg-gray-900">
      <style>{`
        @keyframes ken-burns {
          0% { transform: scale(1); }
          100% { transform: scale(1.1); }
        }
        .animate-ken-burns {
          animation: ken-burns 20s ease-out infinite alternate;
        }
        @keyframes marquee {
          0% { transform: translateX(0); }
          100% { transform: translateX(-50%); }
        }
        .animate-marquee {
          animation: marquee 30s linear infinite;
        }
        @keyframes fadeInUp {
          from { opacity: 0; transform: translateY(20px); }
          to { opacity: 1; transform: translateY(0); }
        }
        .animate-fade-in-up {
          animation: fadeInUp 1s ease-out forwards;
        }
      `}</style>

      {/* Background Images with Crossfade and Zoom */}
      {images.map((img, index) => (
        <div
          key={img}
          className={`absolute inset-0 transition-opacity duration-1000 ease-in-out ${
            index === currentImageIndex ? 'opacity-100' : 'opacity-0'
          }`}
        >
          <img
            src={img}
            alt="Solar Background"
            className="w-full h-full object-cover animate-ken-burns"
          />
          <div className="absolute inset-0 bg-gradient-to-r from-black/90 via-black/60 to-transparent" />
        </div>
      ))}

      {/* Content */}
      <div className="relative h-full container-custom flex flex-col justify-center z-10 pb-20">
        <div className="max-w-4xl space-y-8 animate-fade-in-up">
          <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white/10 backdrop-blur-md border border-white/20 text-white w-fit">
            <span className="w-2 h-2 rounded-full bg-green-400 animate-pulse" />
            <span className="text-sm font-medium tracking-wide uppercase">
              Powering Africa's Future
            </span>
          </div>

          <h1 className="text-5xl md:text-7xl lg:text-8xl font-heading font-bold text-white leading-tight">
            Energy That <br />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-primary to-secondary">
              Never Stops
            </span>
          </h1>

          <p className="text-xl md:text-2xl text-gray-300 max-w-2xl leading-relaxed font-light">
            Premium solar solutions engineered for durability and efficiency. 
            Direct from Guangzhou to your doorstep.
          </p>

          <div className="flex flex-col sm:flex-row gap-6 pt-4">
            <Link 
              to="/browse" 
              className="btn btn-primary btn-lg text-lg px-8 py-4 shadow-lg shadow-primary/30 hover:shadow-primary/50 transition-all transform hover:-translate-y-1 flex items-center justify-center"
            >
              Explore Catalog
              <FiArrowRight className="ml-2" />
            </Link>
            <Link 
              to="/contact" 
              className="btn bg-white/10 backdrop-blur-md border border-white/20 text-white hover:bg-white hover:text-gray-900 btn-lg text-lg px-8 py-4 transition-all flex items-center justify-center"
            >
              Request Quote
            </Link>
          </div>
        </div>
      </div>

      {/* Running Text / Marquee Strip */}
      <div className="absolute bottom-0 left-0 right-0 bg-primary/90 backdrop-blur-md text-white py-4 overflow-hidden z-20 border-t border-white/10">
        <div className="flex animate-marquee whitespace-nowrap">
          {[...Array(4)].map((_, i) => (
            <div key={i} className="flex items-center gap-12 mx-6">
              <span className="text-lg font-bold uppercase tracking-widest flex items-center gap-3">
                <FiPlay className="fill-current w-3 h-3" /> Solar Panels
              </span>
              <span className="text-lg font-bold uppercase tracking-widest flex items-center gap-3">
                <FiPlay className="fill-current w-3 h-3" /> Inverters
              </span>
              <span className="text-lg font-bold uppercase tracking-widest flex items-center gap-3">
                <FiPlay className="fill-current w-3 h-3" /> Lithium Batteries
              </span>
              <span className="text-lg font-bold uppercase tracking-widest flex items-center gap-3">
                <FiPlay className="fill-current w-3 h-3" /> Complete Kits
              </span>
              <span className="text-lg font-bold uppercase tracking-widest flex items-center gap-3">
                <FiPlay className="fill-current w-3 h-3" /> Installation Support
              </span>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default Hero;