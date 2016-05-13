$(document).ready(function() {
  $("#question-form").submit(function(event){
    event.preventDefault()
    var title = $(":input")[2]["value"]
    var body = $(":input")[3]["value"]
    console.log(title)
    console.log(body)
    // $.post() to whatever controller will handle this
  });
});
