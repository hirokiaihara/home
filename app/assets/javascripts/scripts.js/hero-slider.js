//トップページフェイドアニメーション
class HeroSlider {
  constructor(el) {
    this.el = el;
    this.swiper = this._initSwiper();
  }

  _initSwiper() {
    return new Swiper(this.el, {
      loop: true,
      grabCursor: true,
      effect: 'fade',
      centeredSlides: true,
      aledesPerView: 1,
      speed: 1000,
    });
  };

  start(options = {}) {
    options = Object.assign({
      delay: 3000,
      disableOnInteraction: false
    }, options);
    this.swiper.params.autoplay = options
    this.swiper.autoplay.start();
  }
  stop() {
    this.swiper.autoplay.stop();
  }
};