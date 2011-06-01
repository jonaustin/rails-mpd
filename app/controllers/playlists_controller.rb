class PlaylistsController < ApplicationController
  def current
    @player
    @cur_playlist = @player.cur_playlist
  end

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
