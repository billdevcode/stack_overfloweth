$(document).ready(function() {

  $("#question-container").on("submit", "#question-form", function(ev){
    ev.preventDefault();
    var data = $(this).serialize();
    $.ajax({
      url: '/questions',
      method: 'post',
      data: data
    }).done(function(question) {
      $("#myModalNorm").modal("hide");
      $("#question-form")[0].reset();
      $("#questions-list").prepend(question)
  })

  });



});
