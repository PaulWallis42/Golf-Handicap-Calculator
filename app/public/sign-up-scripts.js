$( document ).ready(function() {

  $('#sign-up-button').click(function(event){
    if ($('#email').val() == "" || $('#password').val() == "") {
        event.preventDefault();
        alert("You have to provide an e mail & password");
    }
  });

});
