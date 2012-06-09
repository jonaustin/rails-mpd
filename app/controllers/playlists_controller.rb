class PlaylistsController < ApplicationController
  after_filter :redirect_to_current, except: [:current]

  def current
    @player
    @cur_playlist = @player.cur_playlist
  end

  def move_up
    pos = params.pos.to_i
    @player.move pos, pos-1
  end

  def move_down
    pos = params.pos.to_i
    @player.move pos, pos+1
  end

  def remove
    pos = params.pos.to_i
    @player.delete pos
  end


  protected

  def redirect_to_current
    redirect_to :action => 'current'
  end
end
