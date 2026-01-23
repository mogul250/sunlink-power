import { Helmet } from 'react-helmet-async';
import { FiMail, FiPhone, FiMapPin, FiClock } from 'react-icons/fi';
import { FaWhatsapp } from 'react-icons/fa';

const Contact = () => {
  const contactInfo = [
    {
      icon: FiMapPin,
      title: 'Address',
      content: 'Guangzhou, Guangdong Province, China',
      color: 'text-primary',
    },
    {
      icon: FiPhone,
      title: 'Phone',
      content: '+86 138 0000 0000',
      link: 'tel:+8613800000000',
      color: 'text-secondary',
    },
    {
      icon: FiMail,
      title: 'Email',
      content: 'info@sunlinkpower.com',
      link: 'mailto:info@sunlinkpower.com',
      color: 'text-accent',
    },
    {
      icon: FiClock,
      title: 'Business Hours',
      content: 'Mon - Sat: 9:00 AM - 6:00 PM (GMT+8)',
      color: 'text-primary',
    },
  ];

  return (
    <>
      <Helmet>
        <title>Contact Us - Sunlink Power</title>
        <meta
          name="description"
          content="Get in touch with Sunlink Power. We're here to help you with all your solar energy needs across Africa."
        />
      </Helmet>

      <div className="min-h-screen bg-gray-50">
        {/* Hero Section */}
        <section className="bg-gradient-to-br from-primary-50 to-secondary-50 py-16">
          <div className="container-custom">
            <div className="max-w-3xl">
              <h1 className="text-4xl md:text-5xl font-heading font-bold text-gray-900 mb-4">
                Get in Touch
              </h1>
              <p className="text-lg text-gray-600">
                Have questions about our solar products? Our team is ready to help you 
                find the perfect solution for your energy needs.
              </p>
            </div>
          </div>
        </section>

        {/* Contact Section */}
        <section className="section-padding">
          <div className="container-custom">
            <div className="grid lg:grid-cols-2 gap-12">
              {/* Contact Information */}
              <div className="space-y-8">
                <div>
                  <h2 className="text-2xl font-heading font-bold text-gray-900 mb-4">
                    Contact Information
                  </h2>
                  <p className="text-gray-600 mb-8">
                    Reach out to us through any of the following channels. We're here to help!
                  </p>
                </div>

                <div className="space-y-6">
                  {contactInfo.map((item, index) => (
                    <div key={index} className="flex items-start gap-4">
                      <div className={`w-12 h-12 rounded-lg bg-gray-100 flex items-center justify-center flex-shrink-0 ${item.color}`}>
                        <item.icon className="w-6 h-6" />
                      </div>
                      <div>
                        <h3 className="font-semibold text-gray-900 mb-1">
                          {item.title}
                        </h3>
                        {item.link ? (
                          <a
                            href={item.link}
                            className="text-gray-600 hover:text-primary transition-colors"
                          >
                            {item.content}
                          </a>
                        ) : (
                          <p className="text-gray-600">{item.content}</p>
                        )}
                      </div>
                    </div>
                  ))}
                </div>

                {/* WhatsApp CTA */}
                <div className="card p-6 bg-gradient-to-br from-green-50 to-green-100 border-2 border-green-200">
                  <div className="flex items-center gap-4 mb-4">
                    <div className="w-12 h-12 rounded-full bg-green-500 flex items-center justify-center">
                      <FaWhatsapp className="w-7 h-7 text-white" />
                    </div>
                    <div>
                      <h3 className="font-bold text-gray-900">Instant Support</h3>
                      <p className="text-sm text-gray-600">Chat with us on WhatsApp</p>
                    </div>
                  </div>
                  <a
                    href="https://wa.me/+8613800000000?text=Hi%20Sunlink%2C%20I%20have%20a%20question"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="btn bg-green-500 hover:bg-green-600 text-white w-full"
                  >
                    <FaWhatsapp className="w-5 h-5" />
                    Start Chat
                  </a>
                </div>
              </div>

              {/* Contact Form */}
              <div className="card p-8">
                <h2 className="text-2xl font-heading font-bold text-gray-900 mb-6">
                  Send us a Message
                </h2>
                <form className="space-y-6">
                  <div className="grid md:grid-cols-2 gap-6">
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-2">
                        First Name *
                      </label>
                      <input
                        type="text"
                        required
                        className="input"
                        placeholder="John"
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-2">
                        Last Name *
                      </label>
                      <input
                        type="text"
                        required
                        className="input"
                        placeholder="Doe"
                      />
                    </div>
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Email *
                    </label>
                    <input
                      type="email"
                      required
                      className="input"
                      placeholder="john@example.com"
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Phone Number
                    </label>
                    <input
                      type="tel"
                      className="input"
                      placeholder="+1 234 567 8900"
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Country *
                    </label>
                    <select required className="input">
                      <option value="">Select your country</option>
                      <option value="Kenya">Kenya</option>
                      <option value="Nigeria">Nigeria</option>
                      <option value="Zimbabwe">Zimbabwe</option>
                      <option value="Rwanda">Rwanda</option>
                      <option value="Tanzania">Tanzania</option>
                      <option value="South Africa">South Africa</option>
                      <option value="Zambia">Zambia</option>
                      <option value="Other">Other</option>
                    </select>
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Message *
                    </label>
                    <textarea
                      required
                      rows="5"
                      className="input resize-none"
                      placeholder="Tell us about your solar energy needs..."
                    />
                  </div>

                  <button type="submit" className="btn btn-primary w-full">
                    Send Message
                  </button>
                </form>
              </div>
            </div>
          </div>
        </section>

        {/* Map Section (Placeholder) */}
        <section className="bg-gray-200 h-96">
          <div className="w-full h-full flex items-center justify-center text-gray-500">
            <div className="text-center">
              <FiMapPin className="w-16 h-16 mx-auto mb-4" />
              <p className="text-lg">Map Location</p>
              <p className="text-sm">Guangzhou, China</p>
            </div>
          </div>
        </section>
      </div>
    </>
  );
};

export default Contact;
