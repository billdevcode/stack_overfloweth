$(document).ready(function() {
  $("#question-form").submit(function(event){
    event.preventDefault()
    var title = $(":input")[2]["value"]
    var body = $(":input")[3]["value"]
    console.log(title)
    console.log(body)
    // $.post() to whatever controller will handle this
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
});
