$(function(){
  // 非同期通信時のコメント作成メソッド
  function buildHTML(comment){
    var html =
      `<div class="card w-100 mt-3 comment" data-comment-id="${comment.custom_id}">
        <div class="card-body">
          <h6 class="card-title">
            ${comment.id}: ${comment.user_nickname}
          </h6>
          投稿日: ${comment.created_at}
          <p class="card-text"></p>
          <p>${comment.comment}</p>
          <p></p>
        </div>
      </div>
      `
    return html;
  }

  $('#form-js-ajax').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.js-ajax-card').append(html);
      $('html,body').animate({ scrollTop: $('.js-ajax-card')[0].scrollHeight});
      $('#form-send-button').prop("disabled", false);
      $('#form-js-ajax')[0].reset();
    })
    .fail(function() {
      alert('通信エラー');
    });
  });  

  var reloadMessages = function() {
    var last_comment_id = $('.comment:last').data("comment-id");
    var url = $(location).attr("pathname")
    $.ajax({
      url: `${url}/api/comments`,
      type: 'get',
      dataType: 'json',
      data: {id: last_comment_id}
    })
    .done(function(comments) {
      if (comments.length !== 0) {
        var insertHTML = '';
        $.each(comments, function(i, comment) {
          insertHTML += buildHTML(comment)
        });
        $('.js-ajax-card').append(insertHTML);
        $('html,body').animate({ scrollTop: $('.js-ajax-card')[0].scrollHeight});
      }
    })
    .fail(function() {
      alert('error');
    });
  };

  // ７秒毎にreloadMessagesメソッドを動かす
  if (document.location.href.match(/\/boards\/\d+/)) {
    setInterval(reloadMessages, 7000);
  }
});