$('#controls').html("<%= escape_javascript(render(partial: 'player/controls'))%>")
$('#current_info').html("<%= escape_javascript(render(partial: 'player/songinfo', locals: { cur_song: @player.cur_song }))%>")
