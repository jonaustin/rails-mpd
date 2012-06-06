//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_self
//= require_tree .

->
  $('.controls').bind("ajax:success", (evt, data, status, xhr) ->
    $('ul#current_info').html(xhr.responseText)
  )
  $('#sync_mpd').bind('ajax:success', (evt, data, status, xhr) ->
    $('#info').html(xhr.responseText)
  )
