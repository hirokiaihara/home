//画像の読み込みと挿入
class AddPreview {
  constructor(preview, imgBox, imgFile) {
    const buildImg = (index, url) => {
      const html = `<img data-index="${index}" src="${url}">`;
      return html;
    }
    document.querySelector(imgFile).addEventListener('change', function(e) {
      const targetIndex = $(this).parent().data('index');
      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
      const img = $(`img[data-index="${targetIndex}"]`)[0];
      if (img) {
        img.setAttribute('src', blobUrl);
      } else {
        $(preview).append(buildImg(targetIndex, blobUrl));
      }
      
      document.querySelector(imgBox).classList.add('hidden');
      console.log(imgBox);
    })
  }
}