$(function(){
  // 非同期通信時のコメント作成メソッド
  function buildHTML(comment){
    var html =
      `<div class="card w-100 mt-3 comment" data-comment-id="${comment.custom_id}">
        <div class="card-body">
          <h6 class="card-title">
            ${comment.id}: ${comment.user_nickname}
            投稿日: ${comment.created_at}
          </h6>
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

  // コメント自動更新
  var reloadMessages = function() {
    //カスタムデータ属性を利用し、ブラウザに表示されている最新メッセージのidを取得
    var last_comment_id = $('.comment:last').data("comment-id");
    var url = $(location).attr("pathname")
    $.ajax({
      //ルーティングで設定した通り/groups/id番号/api/messagesとなるよう文字列を書く
      url: `${url}/api/comments`,
      //ルーティングで設定した通りhttpメソッドをgetに指定
      type: 'get',
      dataType: 'json',
      //dataオプションでリクエストに値を含める
      data: {id: last_comment_id}
    })
    .done(function(comments) {
      if (comments.length !== 0) {
        //追加するHTMLの入れ物を作る
        var insertHTML = '';
        //配列messagesの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
        $.each(comments, function(i, comment) {
          insertHTML += buildHTML(comment)
        });
        //メッセージが入ったHTMLに、入れ物ごと追加
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