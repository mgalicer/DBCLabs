$(document).ready(function(){
  $(".button_to").on('click', function(event){
    event.preventDefault();

    // $(".new-comment").html()
    var el = $(this)
    console.log($(this).attr('action'))
    console.log($(this).attr('method'))

    request = $.ajax({
      url: el.attr('action'),
      method: el.attr('method'),
      dataType: "json"
    })
    request.done(function(response){
      console.log(response)
    })

  })
})