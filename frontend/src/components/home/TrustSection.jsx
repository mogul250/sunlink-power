import { useState, useEffect } from 'react';
import { FiStar, FiMapPin } from 'react-icons/fi';
import { testimonialAPI } from '../../services/api';

const TrustSection = () => {
  const [testimonials, setTestimonials] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchTestimonials();
  }, []);

  const fetchTestimonials = async () => {
    try {
      const response = await testimonialAPI.getApproved({ limit: 6 });
      setTestimonials(response.data.data);
    } catch (err) {
      console.error('Failed to load testimonials:', err);
    } finally {
      setLoading(false);
    }
  };

  const logisticsPartners = [
    { name: 'DHL', logo: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/DHL_Logo.svg' },
    { name: 'FedEx', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/FedEx_Corporation_-_2016_Logo.svg/1280px-FedEx_Corporation_-_2016_Logo.svg.png' },
    { name: 'Maersk', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Maersk_Line_Logo%2C_July_2021.svg/3840px-Maersk_Line_Logo%2C_July_2021.svg.png' },
    { name: 'UPS', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/UPS_Logo_Shield_2017.svg/1920px-UPS_Logo_Shield_2017.svg.png' },
  ];

  return (
    <section className="py-16 md:py-24 bg-gray-50">
      <div className="container-custom">
        {/* Section Header */}
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-heading font-bold text-gray-900 mb-4">
            Trusted by Thousands
          </h2>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto">
            Join our growing family of satisfied customers across Africa
          </p>
        </div>

        {/* Testimonials Grid */}
        {!loading && testimonials.length > 0 && (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-16">
            {testimonials.map((testimonial) => (
              <div key={testimonial.id} className="card p-6 hover:shadow-xl transition-shadow">
                {/* Rating */}
                <div className="flex items-center gap-1 mb-4">
                  {[...Array(testimonial.rating || 5)].map((_, i) => (
                    <FiStar key={i} className="w-5 h-5 fill-accent text-accent" />
                  ))}
                </div>

                {/* Content */}
                <p className="text-gray-700 mb-4 line-clamp-3">
                  "{testimonial.content}"
                </p>

                {/* Author */}
                <div className="flex items-center gap-3 pt-4 border-t border-gray-200">
                  <div className="w-12 h-12 rounded-full bg-gradient-to-br from-primary to-secondary flex items-center justify-center text-white font-bold text-lg">
                    {testimonial.client_name.charAt(0)}
                  </div>
                  <div>
                    <div className="font-semibold text-gray-900">
                      {testimonial.client_name}
                    </div>
                    <div className="flex items-center gap-1 text-sm text-gray-600">
                      <FiMapPin className="w-4 h-4" />
                      {testimonial.country}
                    </div>
                  </div>
                </div>

                {/* Before/After Images */}
                {(testimonial.before_image_url || testimonial.after_image_url) && (
                  <div className="grid grid-cols-2 gap-2 mt-4">
                    {testimonial.before_image_url && (
                      <div className="relative">
                        <img
                          src={testimonial.before_image_url}
                          alt="Before"
                          className="w-full h-24 object-cover rounded-lg"
                        />
                        <span className="absolute top-2 left-2 px-2 py-1 bg-black/70 text-white text-xs rounded">
                          Before
                        </span>
                      </div>
                    )}
                    {testimonial.after_image_url && (
                      <div className="relative">
                        <img
                          src={testimonial.after_image_url}
                          alt="After"
                          className="w-full h-24 object-cover rounded-lg"
                        />
                        <span className="absolute top-2 left-2 px-2 py-1 bg-primary text-white text-xs rounded">
                          After
                        </span>
                      </div>
                    )}
                  </div>
                )}
              </div>
            ))}
          </div>
        )}

        {/* Logistics Partners */}
        <div className="bg-white rounded-2xl shadow-md p-8">
          <h3 className="text-xl font-heading font-bold text-center text-gray-900 mb-8">
            Our Logistics Partners
          </h3>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8 items-center">
            {logisticsPartners.map((partner) => (
              <div
                key={partner.name}
                className="flex items-center justify-center hover:grayscale-0 transition-all hover:opacity-100"
              >
                <img
                  src={partner.logo}
                  alt={partner.name}
                  className="h-[120px] w-auto object-contain"
                />
              </div>
            ))}
          </div>
        </div>

        {/* Stats */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-6 mt-12">
          <div className="text-center">
            <div className="text-4xl font-bold text-primary mb-2">10,000+</div>
            <div className="text-gray-600">Happy Customers</div>
          </div>
          <div className="text-center">
            <div className="text-4xl font-bold text-secondary mb-2">15+</div>
            <div className="text-gray-600">Countries Served</div>
          </div>
          <div className="text-center">
            <div className="text-4xl font-bold text-accent mb-2">99.8%</div>
            <div className="text-gray-600">Satisfaction Rate</div>
          </div>
          <div className="text-center">
            <div className="text-4xl font-bold text-primary mb-2">24/7</div>
            <div className="text-gray-600">Customer Support</div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default TrustSection;
