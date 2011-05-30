$(function() {
  
  $("a#previous").click(function() { 
    $.get('/previous');
  });

});
