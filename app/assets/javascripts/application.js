//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_self
//= require_tree .

$(function() {
  
  $('.controls').bind("ajax:success", function(evt, data, status, xhr) {
    $('ul#current_info').html(xhr.responseText);
  });

  $('#sync_mpd').bind('ajax:success', function(evt, data, status, xhr) {
    $('#info').html(xhr.responseText)
  });
  
});
