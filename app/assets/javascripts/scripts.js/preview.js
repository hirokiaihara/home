class Preview {
  constructor() {
    new ChangeImage('.userImg-file', '.userImg-preview');
  }
}

class ChangeImage {
  constructor(file, preview, deleteBtn) {
    this.file = file;
    this.preview = preview;
    this.deleteBtn = deleteBtn;
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