//コメントモーダル
$(document).on('DOMContentLoaded', function() {
  $('.modal-openBtn').on('click', function() {
    $('.modal').show();
    $('.modal-mask').show();
    $('.modal-closeBtn').on('click', function() {
    $('.modal').hide();
    $('.modal-mask').hide();
    });
  });
});