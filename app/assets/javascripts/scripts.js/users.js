$(function() {
  function addUser(user) {
    if (user.user_image) {
      let html = `<div class="group-form__user">
                    <p class="group-form__user-nickname">${user.nickname}</p>
                    <img src=${user.user_image}>
                    <div class="user-search-add group-form__btn group-form__btn--add" data-user-id="${user.id}" data-user-nickname="${user.nickname}" >追加<div>
                  </div>`;
      $("#user-search-result").append(html);
    } else {
      let html = `<div class="group-form__user">
                    <p class="group-form__user-nickname">${user.nickname}</p>
                    <div class="user-search-add group-form__btn group-form__btn--add" data-user-id="${user.id}" data-user-nickname="${user.nickname}">追加<div>
                  </div>`;
      $("#user-search-result").append(html);
    }
  }

  function addNoUser() {
    let html = `<div class="group-form__user">
                  <p class="group-form__user-nickname">ユーザーが見つかりません</p>
                </div>`;
    $("#user-search-result").append(html);
  }

  function addDeleteUser(nickname, id) {
    let html = `<div class="group-form__user" id="${id}">
                  <p class="group-form__user-nickname">
                    ${nickname}
                  <div class="user-search-remove group-form__btn group-form__btn--remove js-remove-btn" data-user-id="${id}" data-user-nickname="${nickname}">削除<div>
                </div>`
    $(".js-add-user").append(html);
  }

  function addMember(userId) {
    let html = `<input value="${userId}" name="group[user_ids][]" type="hidden" id="group_user_ids_${userId}"/>`;
    $(`#${userId}`).append(html);
  }

  $('#user-search-field').on("keyup", function() {
    let input = $('#user-search-field').val();
    $.ajax({
      type: "GET",
      url: "/users",
      data: { keyword: input },
      dataType: "json"
    })
    .done(function(users) {
      $("#user-search-result").empty();
      if (users.length !== 0) {
        users.forEach(function(user) {
          addUser(user);
        });
      } else if (input.length == 0) {
        return false;
      } else {
        addNoUser();
      }
    })
    .fail(function() {
      alert('通信エラー・ユーザーが表示できません');
    });
  });
  
  $(document).on("click", ".group-form__btn--add", function() {
    const userNickname = $(this).attr("data-user-nickname");
    const userId = $(this).attr("data-user-id");
    $(this).parent().remove();
    addDeleteUser(userNickname, userId);
    addMember(userId);
  });

  $(document).on("click", ".group-form__btn--remove", function() {
    $(this).parent().remove();
  });
});
