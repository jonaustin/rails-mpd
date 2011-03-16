module Player
  class MPDAbstract
    #Note: its real ugly to start/stop in every function (must be a way in ruby similar to rails' before/after filters?), but can't keep an open connection as otherwise MPD's Max Connections overfill (though as I'm checking for connected? everytime don't really get why thats happening..)

    # Initialize MPD connection
    def initialize
      @mpd = MPD.new MPD_HOST, MPD_PORT unless @mpd
    end

    def start
      unless @mpd.connected?
        @mpd.disconnect
        @mpd.connect( true ) 
      end
    end

    def disconnect
      @mpd.disconnect if @mpd.connected?
    end


    def play(pos)
      self.start
      @mpd.play(post)
      self.disconnect
    end


    def previous
      self.start
      @mpd.previous
      self.disconnect
    end

    def next
      self.start
      @mpd.next
      self.disconnect
    end


    def pause_play
      self.start
      if @mpd.stopped?
        @mpd.play 0
      else
        @mpd.pause = (@mpd.paused? ? false : true)
      end
      self.disconnect
    end


    def stop
      self.start
      @mpd.stop
      self.disconnect
    end


    def repeat
      self.start
      @mpd.repeat = (@mpd.repeat? ? false : true)
      self.disconnect
    end

    def playlist_move_up(pos)
      self.start
      @mpd.move pos, pos-1
      self.disconnect
    end

    def playlist_move_down(pos)
      self.start
      @mpd.move pos, pos+1
      self.disconnect
    end

    def playlist_remove(pos)
      self.start
      @mpd.delete pos
      self.disconnect
    end

    ### State
    def cur_track
      self.start
      @mpd.current_song
      self.disconnect
    end

    def cur_playlist
      self.start
      @mpd.playlist
      self.disconnect
    end

    def playing?
      self.start
      @mpd.playing?
      self.disconnect
    end

    def stopped?
      self.start
      @mpd.stopped
      self.disconnect
    end

    def repeat?
      self.start
      @mpd.repeat?
      self.disconnect
    end
  end
end
