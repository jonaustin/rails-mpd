class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :connect_mpd

  def my_state_callback( newstate )
    logger.info "MPD Changed State: #{newstate}"
  end


  def connect_mpd
    @mpd = MPD.new MPD_HOST, MPD_PORT unless @mpd
    unless @mpd.connected?
      @mpd.disconnect
      @mpd.connect( true ) 
    end
    state_cb = self.method 'my_state_callback'
    @mpd.register_callback state_cb, MPD::STATE_CALLBACK

    # set variables for global controls
    @cur_track    = @mpd.current_song
    @cur_playlist = @mpd.playlist
    @playing      = @mpd.playing?
    @stopped      = @mpd.stopped?
    @playlist     = @mpd.playlist
    @repeat       = @mpd.repeat?
  end
end
