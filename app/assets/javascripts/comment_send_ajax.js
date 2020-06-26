$(function(){
  function buildHTML(comment){
    var html =
      `<div class="card w-100 mt-3">
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
  });  
});