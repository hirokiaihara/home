$(function() {
  function buildHTML(message){
    var current_user_id = $('.current_user_id').val();
    if (message.user_id == current_user_id) {
      if (message.user_image) {
        if (message.message_image) {
          var html = `<div class="message" data-message-id=${message.id}>
                        <div class = "right-message">
                          <div class = "right-message__body">
                            <div class = "right-message__image">
                              <img src=${message.message_image}>
                            </div>
                            <div class = "right-message__text">
                              ${message.message_text}
                            </div>
                            <div class = "right-message__created-at">
                              ${message.created_at}
                              <a href = "/groups/${message.group_id}/messages/${message.id}" data-method="delete" >削除</a>
                            </div>
                          </div>
                          <div class = "right-message__user">
                            <div class = "right-message__user-image">
                              <img src=${message.user_image}>
                            </div>
                            <div class="right-message__user-nickname">
                              ${message.user_nickname}
                            </div>
                          </div>
                        </div>
                      </div>`
          return html;
        } else {
          var html = `<div class="message" data-message-id=${message.id}>
                        <div class = "right-message">
                          <div class = "right-message__body">
                            <div class = "right-message__text">
                              ${message.message_text}
                            </div>
                            <div class = "right-message__created-at">
                              ${message.created_at}
                              <a href = "/groups/${message.group_id}/messages/${message.id}" data-method="delete" >削除</a>
                            </div>
                          </div>
                          <div class = "right-message__user">
                            <div class = "right-message__user-image">
                              <img src=${message.user_image}>
                            </div>
                            <div class="right-message__user-nickname">
                              ${message.user_nickname}
                            </div>
                          </div>
                        </div>
                      </div>`
          return html;
        };
      } else {
        if (message.message_image) {
          var html = `<div class="message" data-message-id=${message.id}>
                        <div class = "right-message">
                          <div class = "right-message__body">
                            <div class = "right-message__image">
                              <img src=${message.message_image}>
                            </div>
                            <div class = "right-message__text">
                              ${message.message_text}
                            </div>
                            <div class = "right-message__created-at">
                              ${message.created_at}
                              <a href = "/groups/${message.group_id}/messages/${message.id}" data-method="delete" >削除</a>
                            </div>
                          </div>
                          <div class = "right-message__user">
                            <div class="right-message__user-nickname">
                              ${message.user_nickname}
                            </div>
                          </div>
                        </div>
                      </div>`
          return html;
        } else {
          var html = `<div class="message" data-message-id=${message.id}>
                        <div class = "right-message">
                          <div class = "right-message__body">
                            <div class = "right-message__text">
                              ${message.message_text}
                            </div>
                            <div class = "right-message__created-at">
                              ${message.created_at}
                              <a href = "/groups/${message.group_id}/messages/${message.id}" data-method="delete" >削除</a>
                            </div>
                          </div>
                          <div class = "right-message__user">
                            <div class="right-message__user-nickname">
                              ${message.user_nickname}
                            </div>
                          </div>
                        </div>
                      </div>`
          return html;
        };
      }
    } else {
      if (message.user_image) {
        if (message.message_image) {
          var html = `<div class="message" data-message-id=${message.id}>
                        <div class = "left-message">
                          <div class = "left-message__user">
                            <div class = "left-message__user-image">
                              <img src=${message.user_image}>
                            </div>
                            <div class="left-message__user-nickname">
                              ${message.user_nickname}
                            </div>
                          </div>
                          <div class = "left-message__body">
                            <div class = "left-message__image">
                              <img src=${message.message_image}>
                            </div>
                            <div class = "left-message__text">
                              ${message.message_text}
                            </div>
                            <div class = "left-message__created-at">
                              ${message.created_at}
                            </div>
                          </div>
                        </div>
                      </div>`
          return html;
        } else {
          var html = `<div class="message" data-message-id=${message.id}>
                        <div class = "left-message">
                          <div class = "left-message__user">
                            <div class = "left-message__user-image">
                              <img src=${message.user_image}>
                            </div>
                            <div class="left-message__user-nickname">
                              ${message.user_nickname}
                            </div>
                          </div>
                          <div class = "left-message__body">
                            <div class = "left-message__text">
                              ${message.message_text}
                            </div>
                            <div class = "left-message__created-at">
                              ${message.created_at}
                            </div>
                          </div>
                        </div>
                      </div>`
          return html;
        };
      } else {
        if (message.message_image) {
          var html = `<div class="message" data-message-id=${message.id}>
                        <div class = "left-message">
                          <div class = "left-message__user">
                            <div class="left-message__user-nickname">
                              ${message.user_nickname}
                            </div>
                          </div>
                          <div class = "left-message__body">
                            <div class = "left-message__image">
                              <img src=${message.message_image}>
                            </div>
                            <div class = "left-message__text">
                              ${message.message_text}
                            </div>
                            <div class = "left-message__created-at">
                              ${message.created_at}
                            </div>
                          </div>
                        </div>
                      </div>`
          return html;
        } else {
          var html = `<div class="message" data-message-id=${message.id}>
                        <div class = "left-message">
                          <div class = "left-message__user">
                            <div class="left-message__user-nickname">
                              ${message.user_nickname}
                            </div>
                          </div>
                          <div class = "left-message__body">
                            <div class = "left-message__text">
                              ${message.message_text}
                            </div>
                            <div class = "left-message__created-at">
                              ${message.created_at}
                            </div>
                          </div>
                        </div>
                      </div>`
          return html;
        };
      }
    }
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault()
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.messages').append(html);
      $('.messages').animate({ scrollTop: $('.messages')[0].scrollHeight});
      $('#new_message')[0].reset();
      $(".group-footer-container__submit").removeAttr("disabled");
    })
    .fail(function() {
      alert("メッセージ送信失敗")
      $(".group-footer-container__submit").removeAttr("disabled");
    })
  });

  var reloadMessages = function() {
    var last_message_id = $('.message:last').data("message-id");
    $.ajax({
      url: "api/messages",
      type: 'get',
      dataType: 'json',
      data: {id: last_message_id}
    })
    .done(function(messages) {
      if (messages.length !== 0) {
        var insertHTML = '';
        $.each(messages, function(i, message) {
          insertHTML += buildHTML(message)
        });
        $('.messages').append(insertHTML);
        $('.messages').animate({scrollTop: $('.messages')[0].scrollHeight});
      }
    })
    .fail(function() {
      alert('error');
    });
  };
  if (document.location.href.match(/\/groups\/\d+\/messages/)) {
    setInterval(reloadMessages, 4500);
    $('.messages').animate({ scrollTop: $('.messages')[0].scrollHeight});
  }
});
