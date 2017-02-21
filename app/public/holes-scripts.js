$( document ).ready(function() {

  $('#hole-button').click(function(event){
    if ($('#shots').val() == "") {
        event.preventDefault();
        alert("Shots can't be left blank");
    }
  });

});
