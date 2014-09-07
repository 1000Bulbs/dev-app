$(document).ready(function () {
  // Load THINGS data immediately
  $.ajax({
    url: '/things',
    method: 'GET'
  }).done(function (data) {
    console.log(data);
    data.forEach(function (d) {
      $('#flex-container').append("<li class=\"flex-item\">" + d + "</li>");
    });
  });
});

$(function() {
  $( "#slider-range" ).slider({
    range: true,
    min: 0,
    max: 100,
    values: [ 20, 80 ],
    slide: function( event, ui ) {
      $( "#amount" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      
      var data = {};

      // Get the data from the form elements
      data.start = ui.values[ 0 ]
      data.finish = ui.values[ 1 ]

      $.ajax({
        url: '/things',
        method: 'POST',
        data: data
      }).done(function (response) {
        console.log(response);
        $('#flex-container').empty();
        response.forEach(function (d) {
          $('#flex-container').append("<li class=\"flex-item\">" + d + "</li>");
        });
        $('#amount').empty();
        $( "#amount" ).append( $( "#slider-range" ).slider( "values", 0 ) +
          " - " + $( "#slider-range" ).slider( "values", 1 ));
      });
    }
  });
  $( "#amount" ).append( $( "#slider-range" ).slider( "values", 0 ) +
    " - " + $( "#slider-range" ).slider( "values", 1 ));
});
