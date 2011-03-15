module MPDAbstract
  # Initialize MPD connection
  @mpd = MPD.new MPD_HOST, MPD_PORT unless @mpd
  unless @mpd.connected?
    @mpd.disconnect
    @mpd.connect( true ) 
  end


  def self.play(pos)
    @mpd.play(post)
  end


  def self.previous
    @mpd.previous
  end

  def self.next
    @mpd.next
  end


  def self.pause_play
    if @mpd.stopped?
      @mpd.play 0
    else
      @mpd.pause = (@mpd.paused? ? false : true)
    end
  end


  def self.stop
    @mpd.stop
  end


  def self.repeat
    @mpd.repeat = (@mpd.repeat? ? false : true)
  end

  def self.playlist_move_up(pos)
    @mpd.move pos, pos-1
  end

  def self.playlist_move_down(pos)
    @mpd.move pos, pos+1
  end

  def self.playlist_remove(pos)
    @mpd.delete pos
  end

  ### State
  def cur_track
    @mpd.current_song
  end

  def cur_playlist
    @mpd.playlist
  end

  def playing?
    @mpd.playing?
  end

  def stopped?
    @mpd.stopped
  end

  def repeat?
    @mpd.repeat?
  end
end
