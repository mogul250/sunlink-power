import { Helmet } from 'react-helmet-async';
import { FiShield, FiSearch, FiCheckCircle, FiUsers } from 'react-icons/fi';

const About = () => {
  const values = [
    {
      icon: FiShield,
      title: 'Durability',
      description: 'Products built to last in demanding environments.'
    },
    {
      icon: FiSearch,
      title: 'Transparency',
      description: 'Real specifications and honest pricing.'
    },
    {
      icon: FiCheckCircle,
      title: 'Reliability',
      description: 'Stable supply from our Guangzhou warehouse.'
    },
    {
      icon: FiUsers,
      title: 'Partnership',
      description: 'Empowering dealers and distributors to scale.'
    }
  ];

  return (
    <>
      <Helmet>
        <title>About Sunlink Power - Premier Solar Solutions</title>
        <meta name="description" content="Sunlink Power is a premier Chinese energy company headquartered in Guangzhou, specializing in high-performance solar products for the African market." />
      </Helmet>

      <div className="min-h-screen bg-gray-50">
        {/* Section 1: Who We Are (Hero) */}
        <section className="bg-gradient-to-br from-primary-50 to-secondary-50 py-16 md:py-24">
          <div className="container-custom text-center">
            <h1 className="text-4xl md:text-5xl font-heading font-bold text-gray-900 mb-6">
              About Sunlink Power
            </h1>
            <p className="text-xl text-gray-600 max-w-4xl mx-auto leading-relaxed">
              Sunlink Power is a premier Chinese energy company headquartered in the global trade hub of <strong>Guangzhou, China</strong>. We specialize in the end-to-end manufacturing and distribution of high-performance solar products and energy accessories. By maintaining a physical presence with a dedicated <strong>showroom for displays</strong> and a <strong>large-scale warehouse for stock</strong>, we bridge the gap between world-class manufacturing and reliable energy access.
            </p>
          </div>
        </section>

        {/* Section 2: Vision & Mission */}
        <section className="py-16 bg-white">
          <div className="container-custom">
            <div className="grid md:grid-cols-2 gap-12">
              <div className="bg-primary-50 p-8 rounded-2xl">
                <h2 className="text-2xl font-heading font-bold text-primary mb-4">Our Vision</h2>
                <p className="text-lg text-gray-700">
                  To become the most trusted solar and energy products supplier for African importers and entrepreneurs in China.
                </p>
              </div>
              <div className="bg-secondary-50 p-8 rounded-2xl">
                <h2 className="text-2xl font-heading font-bold text-secondary mb-4">Our Mission</h2>
                <ul className="space-y-3 text-gray-700">
                  <li className="flex gap-3">
                    <span className="text-secondary font-bold">•</span>
                    To provide high-quality solar and energy products that meet international standards.
                  </li>
                  <li className="flex gap-3">
                    <span className="text-secondary font-bold">•</span>
                    To offer factory-direct pricing without compromising on quality.
                  </li>
                  <li className="flex gap-3">
                    <span className="text-secondary font-bold">•</span>
                    To support African entrepreneurs in growing their local energy businesses through reliable supply chains.
                  </li>
                  <li className="flex gap-3">
                    <span className="text-secondary font-bold">•</span>
                    To deliver clean, sustainable energy solutions across the continent.
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </section>

        {/* Section 3: The Sunlink Advantage */}
        <section className="py-16 md:py-24 bg-gray-50">
          <div className="container-custom">
            <div className="text-center mb-12">
              <h2 className="text-3xl font-heading font-bold text-gray-900 mb-4">The Sunlink Advantage</h2>
              <p className="text-lg text-gray-600 max-w-3xl mx-auto">
                We understand that African buyers look for brands that are professional, serious, and international. Our business model is built on transparency and support.
              </p>
            </div>
            
            <div className="grid md:grid-cols-2 gap-8">
              <div className="bg-white p-8 rounded-xl shadow-sm">
                <h3 className="text-xl font-bold text-gray-900 mb-3">Direct Factory Partnerships</h3>
                <p className="text-gray-600">We work directly with Chinese factories to ensure you get the best specs and real wattage.</p>
              </div>
              <div className="bg-white p-8 rounded-xl shadow-sm">
                <h3 className="text-xl font-bold text-gray-900 mb-3">Guangzhou Logistics Hub</h3>
                <p className="text-gray-600">We partner with verified shipping companies to make the export process fast and secure.</p>
              </div>
              <div className="bg-white p-8 rounded-xl shadow-sm">
                <h3 className="text-xl font-bold text-gray-900 mb-3">Quality & Warranty</h3>
                <p className="text-gray-600">We focus on durability, battery longevity, and honest specifications, backed by a strong after-sales support system.</p>
              </div>
              <div className="bg-white p-8 rounded-xl shadow-sm">
                <h3 className="text-xl font-bold text-gray-900 mb-3">Free Training</h3>
                <p className="text-gray-600">We don’t just sell; we teach. We offer free installation training, PDF manuals, and technical video tutorials to ensure our partners succeed.</p>
              </div>
            </div>
          </div>
        </section>

        {/* Section 4: Market Presence */}
        <section className="py-16 bg-white border-y border-gray-100">
          <div className="container-custom">
             <div className="grid md:grid-cols-2 gap-12 items-center">
                <div>
                   <h2 className="text-3xl font-heading font-bold text-gray-900 mb-6">Our Market Presence</h2>
                   <p className="text-lg text-gray-600 mb-6 leading-relaxed">
                     While we are based in China, our heart is in Africa. We actively serve high-need markets including <strong>Zimbabwe, Rwanda, Nigeria, Kenya, and Tanzania</strong>, as well as emerging markets across North and West Africa.
                   </p>
                   <p className="text-lg text-gray-600 leading-relaxed">
                     You will find us at major international trade events like the <strong>Canton Fair</strong> and the <strong>China-Africa Economic Expo</strong>, building the partnerships that power the future.
                   </p>
                </div>
                <div className="rounded-2xl overflow-hidden shadow-lg h-80">
                   <img src="https://images.unsplash.com/photo-1526304640152-d4619684e484?w=800" alt="Global Trade" className="w-full h-full object-cover" />
                </div>
             </div>
          </div>
        </section>

        {/* Section 5: Core Values */}
        <section className="py-16 md:py-24 bg-gray-50">
          <div className="container-custom">
            <h2 className="text-3xl font-heading font-bold text-gray-900 mb-12 text-center">Our Core Values</h2>
            <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
              {values.map((value, index) => (
                <div key={index} className="bg-white p-8 rounded-xl shadow-sm hover:shadow-md transition-shadow text-center">
                  <div className="w-16 h-16 bg-primary-50 rounded-full flex items-center justify-center text-primary mb-6 mx-auto">
                    <value.icon className="w-8 h-8" />
                  </div>
                  <h3 className="text-xl font-bold text-gray-900 mb-3">{value.title}</h3>
                  <p className="text-gray-600">{value.description}</p>
                </div>
              ))}
            </div>
          </div>
        </section>
      </div>
    </>
  );
};

export default About;