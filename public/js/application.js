$(document).ready(function() {
  $('#answer-form').on('submit', function(event) {
    event.preventDefault();
    console.log('hi');

  $.ajax({
    method: 'POST',
    url: $('#answer-form').attr('action'),
    data: $('#answer-form').serialize()
  })

  .done(function(response) {
      console.log(response);
      $('#answer-form').html(response)
      // returns html for next page response
    });
  });
});




  // find the right place to listen to
  // add and on submit function
  // stop the default action
  // take in the link that was going to post
  // using like attr
  // reassign the spot where it's going to add to
  // probably need to load a partial


  // id we want to target answer-form

