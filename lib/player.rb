module Player
  class MPDAbstract
    #Note: its real ugly to start/stop in every function (must be a way in ruby similar to rails' before/after filters?), but can't keep an open connection as otherwise MPD's Max Connections overfill (though as I'm checking for connected? everytime don't really get why thats happening..)

    # Initialize MPD connection
    def initialize
      @mpd = MPD.new MPD_HOST, MPD_PORT unless @mpd
    end

    def mpd
      @mpd
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


    def play(pos)
      self.connect
      @mpd.play(pos)
      self.disconnect
    end


    def previous
      self.connect
      @mpd.previous
      self.disconnect
    end

    def next
      self.connect
      @mpd.next
      self.disconnect
    end

    def pause
      self.connect
      @mpd.pause = true
      self.disconnect
    end

    def pause_play
      self.connect
      if @mpd.stopped?
        @mpd.play 0
      else
        @mpd.pause = (@mpd.paused? ? false : true)
      end
      self.disconnect
    end

    def stop
      self.connect
      @mpd.stop
      self.disconnect
    end


    def repeat
      self.connect
      @mpd.repeat = (@mpd.repeat? ? false : true)
      self.disconnect
    end

    ### Playlist
    def playlist_move_up(pos)
      self.connect
      @mpd.move pos, pos-1
      self.disconnect
    end

    def playlist_move_down(pos)
      self.connect
      @mpd.move pos, pos+1
      self.disconnect
    end

    def playlist_remove(pos)
      self.connect
      @mpd.delete pos
      self.disconnect
    end

    ### State
    ## Playlist
    def cur_playlist
      self.connect
      playlist = @mpd.playlist
      self.disconnect
      playlist
    end
    def playlist
      self.cur_playlist
    end

    def playlist_pos
      self.connect
      pos = @mpd.status['song'].to_i
      self.disconnect
      pos
    end

    ## Song
    def cur_song
      self.connect
      cur_song = @mpd.current_song
      self.disconnect
      cur_song
    end


    ### Play state
    def connected?
      @mpd.connected?
    end

    def playing?
      self.connect
      is_playing = @mpd.playing?
      self.disconnect
      is_playing
    end

    def paused?
      self.connect
      is_paused = @mpd.paused?
      self.disconnect
      is_paused
    end

    def stopped?
      self.connect
      is_stopped = @mpd.stopped?
      self.disconnect
      is_stopped
    end

    def repeat?
      self.connect
      is_repeat = @mpd.repeat?
      self.disconnect
      is_repeat
    end
  end
end
