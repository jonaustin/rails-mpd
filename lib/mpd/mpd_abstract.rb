module MPDAbstract
  # Initialize MPD connection
  @mpd = MPD.new MPD_HOST, MPD_PORT unless @mpd
  unless @mpd.connected?
    @mpd.disconnect
    @mpd.connect( true ) 
  end


  def self.play
    @mpd.play params['pos']
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

  ### Playlist Actions
  def self.move_up
    pos = params['pos'].to_i
    @mpd.move pos, pos-1
  end

  def self.move_down
    pos = params['pos'].to_i
    @mpd.move pos, pos+1
  end

  def self.remove
    pos = params['pos'].to_i
    @mpd.delete pos
  end
end
