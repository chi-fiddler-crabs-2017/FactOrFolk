$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
$(".question_votes").on("submit", function(event){
  event.preventDefault();
  var url = $(this).children().attr("action");
  var method = $(this).children().attr("method");
  console.log("hiiiiii");
  $.ajax({
    url: url,
    method: method
  })
  .done(function(response){
    console.log("we did it");

    console.log(response);
  })

});


});
