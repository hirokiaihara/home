//ユーザー編集・play投稿&編集・recipe投稿&編集のプレビュー表示機能
class PreviewImage {
  constructor(file, preview) {
    document.querySelector(file).addEventListener('change', function(e) {
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