$(function() {
  
  $('.controls').bind("ajax:success", function(evt, data, status, xhr){
      $('ul#current_info').html(xhr.responseText);
  });
  
});
