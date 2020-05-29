document.addEventListener('DOMContentLoaded', function() {
  //モバイルメニューは共通
  new MobileMenu();
  //urlで条件分岐
  var url = location.pathname
  //トップページでnew
  if (url == "/") {
    new Main();
  }
  //user編集でnew
  if (url == "/users/edit" || url == "/users") {
    new PreviewImage('.userImg-file', '.userImg-preview');
  }
  //play投稿・編集時にnew
  const play_id = $('.play_id').val();
  const EditPlayUrl = `/plays/${play_id}/edit`;
  const InvalidEditPlayUrl = `/plays/${play_id}`;
  if ( url == "/plays/new" || ( url == "/plays" && play_id != null ) || url == EditPlayUrl || url == InvalidEditPlayUrl ) {
    new PreviewImage('.playImg-file', '.playImg-preview');
    new AddNewFile('.material-container', '.material-textGroup', '.material-addBtn', '.material-removeBtn', '.material-alert');
    new AddNewFile('.work-container', '.work-fileGroup', '.work-addBtn', '.work-removeBtn', '.work-alert');
    //works-fileGroupの数をもとにAddPreviewの引数を決める。
    const files = document.querySelectorAll('.work-fileGroup');
    for(let i = 1; i <= files.length; i++) {
      const preIndex = `.preIndex${i}`
      const imgIndex = `.imgIndex${i}`
      const fileIndex = `.fileIndex${i}`
      new AddPreview(preIndex, imgIndex, fileIndex)
    }
  }
  //recipe投稿・編集時にnew
  const recipe_id = $('.recipe_id').val();
  const EditRecipeUrl = `/recipes/${recipe_id}/edit`;
  const InvalidEditRecipeUrl = `/recipes/${recipe_id}`;
  if ( url == "/recipes/new" || (url == "/recipes" && recipe_id != null ) || url == EditRecipeUrl || url == InvalidEditRecipeUrl ) {
    new PreviewImage('.recipeImg-file', '.recipeImg-preview');
    new AddNewFile('.food-container', '.food-textGroup', '.food-addBtn', '.food-removeBtn', '.food-alert');
    new AddNewFile('.make-container', '.make-fileGroup', '.make-addBtn', '.make-removeBtn', '.make-alert');
    //makes-fileGroupの数をもとにAddPreviewの引数を決める。
    const files = document.querySelectorAll('.make-fileGroup');
    for(let i = 1; i <= files.length; i++) {
      const preIndex = `.preIndex${i}`
      const imgIndex = `.imgIndex${i}`
      const fileIndex = `.fileIndex${i}`
      new AddPreview(preIndex, imgIndex, fileIndex)
    }
  }
});