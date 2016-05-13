$(document).ready(function() {

  $("#question-container").on("submit", "#question-form", function(ev){
    ev.preventDefault();
    var data = $(this).serialize();
    $.ajax({
      url: '/questions',
      method: 'post',
      data: data
    }).done(function(question) {
      $("#modal-question").modal("hide");
      $("#question-form")[0].reset();
      $("#questions-list").prepend(question)
  })

  });


  $("#upvote-button").on('click', function(event){
    event.preventDefault();
    console.log(this)
    var url = $(this).parent().attr('action');
    $.ajax({
      url: url,
      method: 'POST',
      data: "data=upvote"
    }).done(function(result){
      console.log(result);
      $("#upvote-button").html(result);
    })
  })

  $("#downvote-button").on('click', function(event){
    event.preventDefault();
    console.log(this)
    var url = $(this).parent().attr('action');
    $.ajax({
      url: url,
      method: 'POST',
      data: "data=downvote"
    }).done(function(result){
      console.log(result);
      $("#downvote-button").html(result);
    })
  })
});
