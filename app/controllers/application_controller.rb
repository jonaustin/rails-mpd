class ApplicationController < ActionController::Base
  include Player

  before_filter :get_player

  def get_player
    if PLAYER_BACKEND == 'MPD'
      mpd = MPD.new MPD_HOST, MPD_PORT
      @player ||= MPDAbstract.new(mpd)
      state_cb = @player.method 'my_state_callback'
      cur_song_cb = @player.method 'cur_song_callback'
      mpd.register_callback(state_cb, MPD::STATE_CALLBACK)
      mpd.register_callback(cur_song_cb, MPD::CURRENT_SONG_CALLBACK)
      mpd.connect true
    end
  end

  protect_from_forgery
end
