$( document ).ready(function() {

  $('#hole-button').click(function(event){
    if ($('#shots').val() == "" || $('#putts').val() == "") {
        event.preventDefault();
        alert("You must provide a value for shots and putts");
    }
  });

});
