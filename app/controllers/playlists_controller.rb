class PlaylistsController < ApplicationController
  def current
    @player
    @cur_playlist = @player.cur_playlist
  end

  def play
    @player.play params['pos']
    redirect_to :action => 'index'
  end


  def previous
    @player.previous
    redirect_to :action => 'index'
  end

  def next
    @player.next
    redirect_to :action => 'index'
  end


  def pause_play
    if @player.stopped?
      @player.play 0
    else
      @player.pause = (@player.paused? ? false : true)
    end

    redirect_to :action => 'index'
  end


  def stop
    @player.stop
    redirect_to :action => 'index'
  end


  def repeat
    @player.repeat = (@player.repeat? ? false : true)
    redirect_to :action => 'index'
  end

  ### Playlist Actions
  def move_up
    pos = params['pos'].to_i
    @player.move pos, pos-1
    redirect_to :action => 'index'
  end

  def move_down
    pos = params['pos'].to_i
    @player.move pos, pos+1
    redirect_to :action => 'index'
  end

  def remove
    pos = params['pos'].to_i
    @player.delete pos
    redirect_to :action => 'index'
  end


end
