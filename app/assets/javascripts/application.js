// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

function seat_category_change(value){
  if (value) {
    $('.seat_number').html("");
    $.ajax({
      type: 'GET',
      url: '/seat_configurations/available_rows',
      data: {
        id: value
      }
    })
  } else {
    $('#booking_total_fare').val("");
    $('.row_number').html("");
    $('.seat_number').html("");
  }
}

function seat_row_change(value) {
  if (value) {
    config_id = $('#booking_seat_configuration_id').val();
    $.ajax({
      type: 'GET',
      url: '/seat_configurations/available_seats',
      data: {
        id: config_id,
        row_number: value
      }
    })
  } else {
    $('.seat_number').html("");
  }
}
