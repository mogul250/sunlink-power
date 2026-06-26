import { Link } from 'react-router-dom';
import {
  FiArrowRight,
  FiCpu,
  FiGlobe,
  FiHeadphones,
  FiShield,
  FiSliders,
  FiTool,
} from 'react-icons/fi';

const TrustSection = () => {
  const strengths = [
    {
      icon: FiCpu,
      title: 'Advanced Technology',
      description: 'High-efficiency solar energy products with intelligent control options.',
    },
    {
      icon: FiShield,
      title: 'Premium Quality',
      description: 'Carefully selected components built for stable long-term use.',
    },
    {
      icon: FiSliders,
      title: 'Custom Solutions',
      description: 'Solar systems matched to project size, site needs, and budgets.',
    },
    {
      icon: FiTool,
      title: 'Expert Engineering',
      description: 'Practical product guidance, installation planning, and technical support.',
    },
    {
      icon: FiGlobe,
      title: 'Global Presence',
      description: 'Serving distributors, project teams, and partners across markets.',
    },
    {
      icon: FiHeadphones,
      title: 'After-Sales Support',
      description: 'Clear assistance for product selection, maintenance, and follow-up.',
    },
  ];

  const projects = [
    {
      title: 'Solar Power Plant',
      description: 'Utility-scale solar project support for reliable clean energy supply.',
      image: 'https://images.unsplash.com/photo-1509391366360-2e959784a276?w=900',
      path: '/browse',
    },
    {
      title: 'Commercial Solar System',
      description: 'Renewable energy systems for factories, offices, hotels, and malls.',
      image: 'https://images.unsplash.com/photo-1497440001374-f26997328c1b?w=900',
      path: '/browse',
    },
    {
      title: 'Solar Street Lighting',
      description: 'Smart outdoor lighting for roads, communities, estates, and public spaces.',
      image: 'https://images.unsplash.com/photo-1519608487953-e999c86e7455?w=900',
      path: '/category/solar-street-lights',
    },
    {
      title: 'Solar Water Pump System',
      description: 'Solar-powered pumping for agriculture, livestock, and rural water access.',
      image: 'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?w=900',
      path: '/kit/agri-solar',
    },
  ];

  return (
    <>
      <section className="bg-white py-14 md:py-20">
        <div className="container-custom">
          <div className="mb-9 text-center">
            <p className="text-sm font-bold uppercase tracking-wide text-[#094fa4]">Our Projects</p>
            <h2 className="mt-3 text-3xl font-bold text-gray-950 md:text-4xl">Real Projects. Real Impact.</h2>
          </div>

          <div className="grid gap-5 sm:grid-cols-2 lg:grid-cols-4">
            {projects.map((project) => (
              <Link
                key={project.title}
                to={project.path}
                className="group overflow-hidden border border-gray-200 bg-white shadow-sm transition hover:border-[#094fa4]/30 hover:shadow-md"
              >
                <div className="h-44 overflow-hidden bg-gray-100">
                  <img
                    src={project.image}
                    alt={project.title}
                    className="h-full w-full object-cover transition duration-500 group-hover:scale-105"
                  />
                </div>
                <div className="p-5">
                  <h3 className="text-base font-bold text-gray-950">{project.title}</h3>
                  <p className="mt-3 line-clamp-3 text-sm leading-6 text-gray-600">{project.description}</p>
                  <div className="mt-5 flex items-center text-sm font-bold text-[#094fa4]">
                    View Project
                    <FiArrowRight className="ml-2 h-4 w-4 transition group-hover:translate-x-1" />
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      <section className="bg-[#094fa4] py-14 text-white md:py-20">
        <div className="container-custom">
          <div className="grid gap-10 lg:grid-cols-[0.8fr_1.2fr] lg:items-center">
            <div>
              <p className="text-sm font-bold uppercase tracking-wide text-[#ffd166]">Why Choose Sunlink Power</p>
              <h2 className="mt-4 text-3xl font-bold leading-tight md:text-4xl">
                Engineering Excellence. Powering Trust.
              </h2>
              <p className="mt-6 max-w-xl leading-8 text-white/80">
                Sunlink Power combines dependable product lines, practical configuration support,
                and quality-focused sourcing for homes, businesses, farms, and infrastructure projects.
              </p>
              <Link to="/about" className="mt-8 inline-flex items-center bg-white px-5 py-3 text-sm font-bold text-[#094fa4] transition hover:bg-[#ffd166] hover:text-[#072f61]">
                Learn More About Us
                <FiArrowRight className="ml-2 h-4 w-4" />
              </Link>
            </div>

            <div className="grid gap-px overflow-hidden border border-white/15 bg-white/15 sm:grid-cols-2 lg:grid-cols-3">
              {strengths.map((item) => (
                <div key={item.title} className="bg-[#073b7a]/70 p-6 backdrop-blur-sm">
                  <item.icon className="h-9 w-9 text-[#ffd166]" />
                  <h3 className="mt-5 text-lg font-bold">{item.title}</h3>
                  <p className="mt-3 text-sm leading-6 text-white/75">{item.description}</p>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      <section className="bg-gradient-to-r from-[#094fa4] via-[#073b7a] to-[#061a33] py-10 text-white">
        <div className="container-custom">
          <div className="grid gap-6 md:grid-cols-[1fr_auto] md:items-center">
            <div>
              <h2 className="text-2xl font-bold md:text-3xl">Let&apos;s Build a Greener Future Together</h2>
              <p className="mt-3 max-w-2xl leading-7 text-white/80">
                Talk to our team about the right solar solution for your home, business, farm, or project.
              </p>
            </div>
            <Link to="/contact" className="inline-flex w-fit items-center bg-white px-5 py-3 text-sm font-bold text-[#094fa4] transition hover:bg-[#ffd166] hover:text-[#072f61]">
              Get a Free Consultation
              <FiArrowRight className="ml-2 h-4 w-4" />
            </Link>
          </div>
        </div>
      </section>
    </>
  );
};

export default TrustSection;
