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
    @player.play params['pos']
    render partial: 'update_controls'
  end


  def previous
    @player.previous
    render partial: 'update_controls'
  end

  def next
    @player.next
    render partial: 'update_controls'
  end


  def pause_play
    @player.pause_play
    @action = (@player.playing? ? 'pause' : 'play')
    render partial: 'update_controls'
  end


  def stop
    @player.stop
    render partial: 'update_controls'
  end


  def repeat
    @player.repeat = (@player.repeat? ? false : true)
    render partial: 'update_controls'
  end


  protected

  def set_cur_song
    @cur_song = @player.cur_song
  end

end
