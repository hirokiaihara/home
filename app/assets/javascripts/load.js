document.addEventListener("turbolinks:load", function() {
  var url = location.pathname
  new MobileMenu();
  if (url == "/") {
    new Main();
  }
  if (url == "/users/edit") {
    new PreviewImage('.userImg-file', '.userImg-preview');
  }
  
  if (url == "/plays/new" || url == "/plays") {
    new PreviewImage('.playImg-file', '.playImg-preview');
    new AddNewFile('.material-container', '.material-textGroup', '.material-addBtn', '.material-removeBtn', '.material-alert');
    new AddNewFile('.work-container', '.work-fileGroup', '.work-addBtn', '.work-removeBtn', '.work-alert');
    new AddPreview('.preIndex1', '.imgIndex1', '.fileIndex1');
  }
});