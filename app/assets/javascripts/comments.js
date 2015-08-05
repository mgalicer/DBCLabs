$(document).ready(function(){
  $(".in-page-comment").on('submit', function(event){
    event.preventDefault();

    var el = $(this)

    var request = $.ajax({
      url: el.attr('action'),
      method: el.attr('method'),
      data: el.serialize(),
      dataType: "json"
    })
    request.done(function(response){
      $(".new-comment").append(response.html)
    })
  })
})