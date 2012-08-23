module Player
  class MPDAbstract
    # Initialize MPD connection
    attr_reader :mpd

    def initialize(mpd)
      @mpd = mpd
      #@mpd = MPD.new MPD_HOST, MPD_PORT unless @mpd
    end

    def my_state_callback( newstate )
      Rails.logger.warn "MPD changed state: #{newstate}"
      #@mpd.next
    end

    def cur_song_callback( mpd_song )
      Rails.logger.warn "MPD changed state: #{mpd_song}"
    end

    def connect
      unless @mpd.connected?
        @mpd.disconnect
        @mpd.connect( true )
      end
    end

    def disconnect
      @mpd.disconnect if @mpd.connected?
    end



    def method_missing(meth, *args, &block)
      @mpd.send(meth, *args)
    end




    def pause_play
      if @mpd.stopped?
        @mpd.play 0
      else
        @mpd.pause = (@mpd.paused? ? false : true)
      end
    end

    def repeat
      @mpd.repeat = (@mpd.repeat? ? false : true)
    end

    ### Playlist
    def playlist_move_up(pos)
      @mpd.move pos, pos-1
    end

    def playlist_move_down(pos)
      @mpd.move pos, pos+1
    end

    def playlist_remove(pos)
      @mpd.delete pos
    end

    ### State
    ## Playlist
    def cur_playlist
      @mpd.playlist
    end

    def playlist_pos
      @mpd.status['song'].to_i
    end

    ## Song
    def cur_song
      @mpd.current_song
    end

  end
end
