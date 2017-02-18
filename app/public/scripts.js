$( document ).ready(function() {

  var oakPark = [
    { number: 1, par: 4, si: 4, distance: 405 },
    { number: 2, par: 4, si: 6, distance: 358 },
    { number: 3, par: 3, si: 12, distance: 157 },
    { number: 4, par: 4, si: 2, distance: 415 },
    { number: 5, par: 4, si: 10, distance: 367 },
    { number: 6, par: 4, si: 8, distance: 348 },
    { number: 7, par: 4, si: 18, distance: 356 },
    { number: 8, par: 3, si: 14, distance: 145 },
    { number: 9, par: 4, si: 16, distance: 308 },
    { number: 10, par: 5, si: 5, distance: 509 },
    { number: 11, par: 4, si: 9, distance: 376 },
    { number: 12, par: 4, si: 1, distance: 362 },
    { number: 13, par: 3, si: 3, distance: 199 },
    { number: 14, par: 4, si: 13, distance: 319 },
    { number: 15, par: 3, si: 7, distance: 176 },
    { number: 16, par: 4, si: 17, distance: 232 },
    { number: 17, par: 5, si: 11, distance: 522 },
    { number: 18, par: 4, si: 15, distance: 288 }
  ]


$.each(oakPark, function(index, value){
  $('#score-card-select').append(
    "<option " + "value='" + value.number + "'" + ">Hole: " + value.number + " - Par: " + value.par +
    " - Distance: " + value.distance + " - SI: " + value.si + "</option>"
  );
});

$('#score-card-select').change(function(){
  var id = $( "select#score-card-select option:checked" ).val();
  $.each(oakPark, function(index, value){
    if (value.number == id) {
      $('.hole-swap').replaceWith(
        '<div class="hole-swap"><input type="hidden" name="number"' + 'value="' + value.number + '">' +
        '<input type="hidden" name="par"' + 'value="' + value.par + '">' +
        '<input type="hidden" name="si"' + 'value="' + value.si + '">' +
        '<input type="hidden" name="distance"' + 'value="' + value.distance + '"></div>'
      )
    };
  });
});


});
