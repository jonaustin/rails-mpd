class PlaylistsController < ApplicationController
  def current
    @player
    @cur_playlist = @player.cur_playlist
  end

  def play
    @player.play params['pos']
    redirect_to :action => 'current'
  end


  def previous
    @player.previous
    redirect_to :action => 'current'
  end

  def next
    @player.next
    redirect_to :action => 'current'
  end


  def pause_play
    @player.pause_play
    redirect_to :action => 'current'
  end


  def stop
    @player.stop
    redirect_to :action => 'current'
  end


  def repeat
    @player.repeat = (@player.repeat? ? false : true)
    redirect_to :action => 'current'
  end

  ### Playlist Actions
  def move_up
    pos = params['pos'].to_i
    @player.move pos, pos-1
    redirect_to :action => 'current'
  end

  def move_down
    pos = params['pos'].to_i
    @player.move pos, pos+1
    redirect_to :action => 'current'
  end

  def remove
    pos = params['pos'].to_i
    @player.delete pos
    redirect_to :action => 'current'
  end


end
