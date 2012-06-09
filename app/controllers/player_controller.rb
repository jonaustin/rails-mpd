class PlayerController < ApplicationController
  respond_to :js
  after_filter :set_cur_song

  # make all these into one method
  def controls
    case params[:control]
    when 'play' 'foo'
    end
  end

  def play
    @player.play params.pos
  end


  def previous
    @player.previous
  end

  def next
    @player.next
  end


  def pause_play
    @player.pause_play
  end


  def stop
    @player.stop
  end


  def repeat
    @player.repeat = (@player.repeat? ? false : true)
  end


  protected

  def set_cur_song
    @cur_song = @player.cur_song
  end

end
