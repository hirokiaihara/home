//入力欄の追加
class AddNewFile {
  constructor(container, group, add, remove, alert) {
    let fileIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    //追加するhtmlを生成
    const buildNewFile = (index) => {
      //材料
      if (add == '.material-addBtn') {
        const html = `<div class ="material-textGroup" data-index="${index}">
                        <input class="material-text" type="text" name="play[materials_attributes][${index}][material_name]" id="play_materials_attributes_${index}_material_name">
                        <i class="far fa-times-circle material-removeBtn">削除</i>
                      </div>`
        return html;
      //作り方
      } else if (add == '.work-addBtn') {
        const html = `<div class ="work-fileGroup" data-index="${index}">
                        <label for="play_works_attributes_${index}_work_image">
                          <div class="work-fileGroup__preview preIndex${index+1}"></div>
                          <div class="work-fileGroup__img imgIndex${index+1}"><i class="fas fa-camera">クリックして写真を追加</i></div>
                        </label>
                        <input class="work-imageFile fileIndex${index+1} hidden" type="file" name="play[works_attributes][${index}][work_image]" id="play_works_attributes_${index}_work_image">
                        <textarea class="work-text" type="textarea" name="play[works_attributes][${index}][work_text]" id="play_works_attributes_${index}_work_text"></textarea>
                        <i class="far fa-times-circle work-removeBtn">削除</i>
                      </div>`
        return html;
      }
    }
    //追加
    document.querySelector(add).addEventListener('click', function() {
      $(container).append(buildNewFile(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
      if ($(group).length == 10) $(add).hide(), $(alert).show();
      if (container == '.work-container') {
        new AddPreview('.preIndex2', '.imgIndex2', '.fileIndex2');
        new AddPreview('.preIndex3', '.imgIndex3', '.fileIndex3');
        new AddPreview('.preIndex4', '.imgIndex4', '.fileIndex4');
        new AddPreview('.preIndex5', '.imgIndex5', '.fileIndex5');
        new AddPreview('.preIndex6', '.imgIndex6', '.fileIndex6');
        new AddPreview('.preIndex7', '.imgIndex7', '.fileIndex7');
        new AddPreview('.preIndex8', '.imgIndex8', '.fileIndex8');
        new AddPreview('.preIndex9', '.imgIndex9', '.fileIndex9');
        new AddPreview('.preIndex10', '.imgIndex10', '.fileIndex10');
      }
    });
    //削除
    $(container).on('click', remove, function() {
      $(this).parent().remove();
      if ($(group).length == 0) $(container).append(buildNewFile(fileIndex[0]));
      if ($(group).length < 10) $(add).show(), $(alert).hide();
    })
  }
}
