//ユーザー編集・play投稿&編集・recipe投稿&編集のプレビュー表示機能
class PreviewImage {
  constructor(file, preview) {
    this.file = file;
    this.preview = preview;
    this._readImage();
  }

  _readImage() {
    var preview = this.preview;
    document.querySelector(this.file).addEventListener('change', function(e) {
      var file = e.target.files[0];
      var fileReader = new FileReader();
      fileReader.onload = function() {
        var dataUrl = this.result;
        var img = document.querySelector(preview);
        img.src = dataUrl;
      }
      fileReader.readAsDataURL(file);
    });
  }
}