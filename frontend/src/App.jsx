import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { HelmetProvider } from 'react-helmet-async';

// Layout Components
import PublicLayout from './layouts/PublicLayout';
import AdminLayout from './layouts/AdminLayout';

// Pages
import Home from './pages/Home';
import Browse from './pages/Browse';
import CategoryDetail from './pages/CategoryDetail';
import ProductDetail from './pages/ProductDetail';
import KitDetail from './pages/KitDetail';
import About from './pages/About';
import Contact from './pages/Contact';
import NotFound from './pages/NotFound';
import Kits from './pages/Kits';

// Admin Pages
import AdminLogin from './pages/admin/AdminLogin';
import ProductForm from './pages/admin/ProductForm';
import ProductList from './pages/admin/ProductList';
import CategoryList from './pages/admin/CategoryList';
import CategoryForm from './pages/admin/CategoryForm';
import KitList from './pages/admin/KitList';
import KitForm from './pages/admin/KitForm';
import TestimonialQueue from './pages/admin/TestimonialQueue';
import Dashboard from './pages/admin/Dashboard';

function App() {
  return (
    <HelmetProvider>
      <Router>
        <Routes>
          {/* Admin Login - Standing alone */}
          <Route path="/admin/login" element={<AdminLogin />} />
          
          {/* Protected Admin Routes */}
          <Route path="/admin" element={<AdminLayout />}>
            <Route index element={<Dashboard />} />
            <Route path="dashboard" element={<Dashboard />} />
            <Route path="products" element={<ProductList />} />
            <Route path="products/new" element={<ProductForm />} />
            <Route path="products/edit/:id" element={<ProductForm />} />
            <Route path="categories" element={<CategoryList />} />
            <Route path="categories/new" element={<CategoryForm />} />
            <Route path="categories/edit/:id" element={<CategoryForm />} />
            <Route path="kits" element={<KitList />} />
            <Route path="kits/new" element={<KitForm />} />
            <Route path="kits/edit/:id" element={<KitForm />} />
            <Route path="testimonials" element={<TestimonialQueue />} />
          </Route>

          {/* Public Routes */}
          <Route element={<PublicLayout />}>
            <Route path="/" element={<Home />} />
            <Route path="/browse" element={<Browse />} />
            <Route path="/category/:slug" element={<CategoryDetail />} />
            <Route path="/product/:id" element={<ProductDetail />} />
            <Route path="/kits" element={<Kits />} />
            <Route path="/kit/:slug" element={<KitDetail />} />
            <Route path="/about" element={<About />} />
            <Route path="/contact" element={<Contact />} />
          </Route>

          {/* Global Catch-all for 404s */}
          <Route path="*" element={<NotFound />} />
        </Routes>
      </Router>
    </HelmetProvider>
  );
}

export default App;