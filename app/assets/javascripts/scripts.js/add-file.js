//入力欄の追加
class AddNewFile {
  constructor(container, group, add, remove, alert) {
    let fileIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    //追加するhtmlを生成
    const buildNewFile = (index) => {
      //play材料入力欄
      if (add == '.material-addBtn') {
        const html = `<div class ="material-textGroup" data-index="${index}">
                        <input class="material-text" type="text" name="play[materials_attributes][${index}][material_name]" id="play_materials_attributes_${index}_material_name">
                        <i class="far fa-times-circle material-removeBtn">削除</i>
                      </div>`
        return html;
      //play作り方入力欄
      } else if (add == '.work-addBtn') {
        const html = `<div class ="work-fileGroup" data-index="${index}">
                        <label for="play_works_attributes_${index}_work_image">
                          <div class="work-fileGroup__preview preIndex${index+1}" id="preIndex"></div>
                          <div class="work-fileGroup__img imgIndex${index+1}"><i class="fas fa-camera">クリックして写真を追加</i></div>
                        </label>
                        <input class="work-imageFile fileIndex${index+1} hidden" type="file" name="play[works_attributes][${index}][work_image]" id="play_works_attributes_${index}_work_image">
                        <textarea class="work-text" type="textarea" name="play[works_attributes][${index}][work_text]" id="play_works_attributes_${index}_work_text"></textarea>
                        <i class="far fa-times-circle work-removeBtn">削除</i>
                      </div>`
        return html;
      //recipe食材入力欄
      } else if (add == '.food-addBtn') {
        const html = `<div class ="food-textGroup" data-index="${index}">
                        <input class="food-text" type="text" name="recipe[foods_attributes][${index}][food_name]" id="recipe_foods_attributes_${index}_food_name">
                        <input class="food-text" type="text" name="recipe[foods_attributes][${index}][quantity]" id="recipe_foods_attributes_${index}_quantity">
                        <i class="far fa-times-circle food-removeBtn">削除</i>
                      </div>`
        return html;
      //recipe作り方入力欄
      } else if (add == '.make-addBtn') {
        const html = `<div class ="make-fileGroup" data-index="${index}">
                        <label for="recipe_makes_attributes_${index}_make_image">
                          <div class="make-fileGroup__preview preIndex${index+1}" id="preIndex"></div>
                          <div class="make-fileGroup__img imgIndex${index+1}"><i class="fas fa-camera">クリックして写真を追加</i></div>
                        </label>
                        <input class="make-imageFile fileIndex${index+1} hidden" type="file" name="recipe[makes_attributes][${index}][make_image]" id="recipe_makes_attributes_${index}_make_image">
                        <textarea class="make-text" type="textarea" name="recipe[makes_attributes][${index}][make_text]" id="recipe_makes_attributes_${index}_make_text"></textarea>
                        <i class="far fa-times-circle make-removeBtn">削除</i>
                      </div>`
        return html;
      }
    }
    //追加
    document.querySelector(add).addEventListener('click', function() {
      //urlで条件分岐
      var url = location.pathname
      const play_id = $('.play_id').val();
      const EditPlayUrl = `/plays/${play_id}/edit`;
      const recipe_id = $('.recipe_id').val();
      const EditRecipeUrl = `/recipes/${recipe_id}/edit`;
      //新規投稿の時
      if (url == "/plays/new" || url == "/recipes/new") {
        $(container).append(buildNewFile(fileIndex[0]));
        fileIndex.shift();
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
        // 10個出た時のアラート
        if ($(group).length == 10) $(add).hide(), $(alert).show();
        //makeの操作時はAddPreviewインスタンスをnew
        if (container == '.work-container' || container == '.recipe-container') {
          const preIndex = `.preIndex${fileIndex[0]}`;
          const imgIndex = `.imgIndex${fileIndex[0]}`;
          const indexFile = `.fileIndex${fileIndex[0]}`;
          new AddPreview(preIndex, imgIndex, indexFile);
        }
      //ヴァリデーションにはじかれた時と投稿編集時
      } else if (url == "/plays" || url == EditPlayUrl || url == "/recipes" || url == EditRecipeUrl) {
        //materialの操作
        if (container == '.material-container') {
          const files = document.querySelectorAll('.material-textGroup');
          $(container).append(buildNewFile(files.length));
          //10個出た時のアラート
          if ($(files).length == 10) $(add).hide(), $(alert).show();
        //workの操作
        } else if (container == '.work-container') {
          const files = document.querySelectorAll('.work-fileGroup');
          $(container).append(buildNewFile(files.length));
          //10個出た時のアラート
          if ($(files).length == 10) $(add).hide(), $(alert).show();
          const preIndex = `.preIndex${files.length+1}`;
          const imgIndex = `.imgIndex${files.length+1}`;
          const indexFile = `.fileIndex${files.length+1}`;
          new AddPreview(preIndex, imgIndex, indexFile);
        //foodの操作
        } else if (container == '.food-container') {
          const files = document.querySelectorAll('.food-textGroup');
          $(container).append(buildNewFile(files.length));
          //10個出た時のアラート
          if ($(files).length == 10) $(add).hide(), $(alert).show();
        //makeの操作
        } else if (container == '.make-container') {
          const files = document.querySelectorAll('.make-fileGroup');
          $(container).append(buildNewFile(files.length));
          //10個出た時のアラート
          if ($(files).length == 10) $(add).hide(), $(alert).show();
          const preIndex = `.preIndex${files.length+1}`;
          const imgIndex = `.imgIndex${files.length+1}`;
          const indexFile = `.fileIndex${files.length+1}`;
          new AddPreview(preIndex, imgIndex, indexFile);
        }
      }
    });
    //削除
    $(container).on('click', remove, function() {
      //material削除
      if (container == '.material-container') {
        const targetIndex = $(this).parent().data('index');
        const hiddenCheck = $(`input[data-Index="${targetIndex}"].hidden-materialDestroy`);
        if (hiddenCheck) hiddenCheck.prop('checked', true);
      //work削除
      } else if (container == '.work-container'){
        const targetIndex = $(this).parent().data('index');
        const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-workDestroy`);
        if (hiddenCheck) hiddenCheck.prop('checked', true);
      //food削除
      } else if (container == '.food-container') {
        const targetIndex = $(this).parent().data('index');
        const hiddenCheck = $(`input[data-Index="${targetIndex}"].hidden-foodDestroy`);
        if (hiddenCheck) hiddenCheck.prop('checked', true);
      //make削除
      } else if (container == '.make-container'){
        const targetIndex = $(this).parent().data('index');
        const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-makeDestroy`);
        if (hiddenCheck) hiddenCheck.prop('checked', true);
      }
      
      //viewを削除と入力欄が0にならないように
      $(this).parent().remove();
      if ($(group).length == 0) $(container).append(buildNewFile(fileIndex[0]));
      if ($(group).length < 10) $(add).show(), $(alert).hide();
    })
  }
}
