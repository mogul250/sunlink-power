import { useEffect, useMemo, useState } from 'react';
import { FiChevronLeft, FiChevronRight } from 'react-icons/fi';

const sliderModules = import.meta.glob('../../assets/sliders/*.{png,PNG,jpg,JPG,jpeg,JPEG,webp,WEBP}', {
  eager: true,
  import: 'default',
  query: '?url',
});

const Hero = () => {
  const [currentSlide, setCurrentSlide] = useState(0);
  const [hasUserInteracted, setHasUserInteracted] = useState(false);
  const sliderImages = useMemo(
    () => Object.entries(sliderModules)
      .sort(([first], [second]) => first.localeCompare(second))
      .map(([, src]) => src),
    []
  );

  useEffect(() => {
    if (sliderImages.length <= 1 || hasUserInteracted) return undefined;

    const interval = window.setInterval(() => {
      setCurrentSlide((current) => (current + 1) % sliderImages.length);
    }, 4000);

    return () => window.clearInterval(interval);
  }, [hasUserInteracted, sliderImages.length]);

  const showPreviousSlide = () => {
    setHasUserInteracted(true);
    setCurrentSlide((current) => {
      if (sliderImages.length <= 1) return current;
      return (current - 1 + sliderImages.length) % sliderImages.length;
    });
  };

  const showNextSlide = () => {
    setHasUserInteracted(true);
    setCurrentSlide((current) => {
      if (sliderImages.length <= 1) return current;
      return (current + 1) % sliderImages.length;
    });
  };

  const showSelectedSlide = (index) => {
    setHasUserInteracted(true);
    setCurrentSlide(index);
  };

  return (
    <section className="relative h-[52vw] min-h-[360px] max-h-[620px] overflow-hidden bg-white text-white">
      <div className="absolute inset-0">
        {sliderImages.map((image, index) => (
          <div
            key={image}
            className={`absolute inset-0 transition-opacity duration-1000 ${
              index === currentSlide ? 'opacity-100' : 'opacity-0'
            }`}
          >
            <img
              src={image}
              alt=""
              className="absolute inset-0 h-full w-full scale-110 object-cover blur-2xl"
            />
            <img
              src={image}
              alt=""
              className="relative h-full w-full object-contain"
            />
          </div>
        ))}
      </div>

      {sliderImages.length > 1 && (
        <>
          <button
            type="button"
            onClick={showPreviousSlide}
            className="absolute left-3 top-1/2 z-30 flex h-10 w-10 -translate-y-1/2 items-center justify-center bg-black/30 text-white backdrop-blur-sm transition hover:bg-black/50 md:left-6 md:h-12 md:w-12"
            aria-label="Show previous slide"
          >
            <FiChevronLeft className="h-6 w-6" />
          </button>

          <button
            type="button"
            onClick={showNextSlide}
            className="absolute right-3 top-1/2 z-30 flex h-10 w-10 -translate-y-1/2 items-center justify-center bg-black/30 text-white backdrop-blur-sm transition hover:bg-black/50 md:right-6 md:h-12 md:w-12"
            aria-label="Show next slide"
          >
            <FiChevronRight className="h-6 w-6" />
          </button>

          <div className="absolute bottom-6 right-6 z-30 hidden items-center gap-2 md:flex">
            {sliderImages.map((image, index) => (
              <button
                key={image}
                type="button"
                onClick={() => showSelectedSlide(index)}
                className={`h-2.5 transition-all ${
                  index === currentSlide ? 'w-8 bg-primary-400' : 'w-2.5 bg-white/45 hover:bg-white'
                }`}
                aria-label={`Show slide ${index + 1}`}
              />
            ))}
          </div>
        </>
      )}
    </section>
  );
};

export default Hero;
