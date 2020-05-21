//トップページの動き
class Main {
  constructor() {
    this.header = document.querySelector('header');
    this._observers = [];
    this._init();
  }

  set observers(val) {
    this._observers.push(val);
  }

  get observers() {
    return this._observers;
  }

  _init() {
    this.hero = new HeroSlider('.swiper-container');
    Pace.on('done', this._paceDone.bind(this));
  }

  _paceDone() {
    this._scrollInit();
  }

  _toogleSlideAnimation(el, inview) {
    if(inview) {
      this.hero.start();
    } else {
      this.hero.stop();
    }
  }

  _navAnimation(el, inview) {
    if(inview) {
      this.header.classList.remove('triggered');
    } else {
      this.header.classList.add('triggered');
    }
  }

  _inviewAnimation(el, inview) {
    if(inview) {
      el.classList.add('inview');
    } else {
      el.classList.remove('inview');
    }
  }
  //テキストアニメーション
  // _textAnimation = function(el, inview) {
  //   if(inview) {
  //     const ta = new TextAnimation(el);
  //     ta.animate();
  //   }
  // }

  _scrollInit() {
    this.observers = new ScrollObserver('.nav-trigger', this._navAnimation.bind(this), {once: false});
    this.observers = new ScrollObserver('.swiper-container', this._toogleSlideAnimation.bind(this), {once: false});
    this.observers = new ScrollObserver('.appear', this._inviewAnimation.bind(this), {once: false});
    // this.observers = new ScrollObserver('.animate-title', this._textAnimation);
  }
}