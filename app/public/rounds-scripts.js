$( document ).ready(function() {

  $('#round-button').click(function(event){
    if ($('#date').val() == "" || $('#score').val() == "") {
        event.preventDefault();
        alert("Date and Score can't be blank");
    }
  });

});
