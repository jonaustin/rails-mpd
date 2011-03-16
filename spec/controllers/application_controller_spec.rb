require 'spec_helper'
require 'net/telnet'
# Only going to deal with MPD as a backend for now, so use net/telnet interface to verify.

describe ApplicationController do
  describe "modify play state" do
    it "should go to previous track when H" do
      pending
      @mpd.previous
    end

    it "self.next" do
      pending
      @mpd.next
    end


    it "self.pause_play" do
      pending
      if @mpd.stopped?
        @mpd.play 0
      else
        @mpd.pause = (@mpd.paused? ? false : true)
      end
    end


    it "self.stop" do
      pending
      @mpd.stop
    end


    it "self.repeat" do
      pending
      @mpd.repeat = (@mpd.repeat? ? false : true)
    end

    it "self.playlist_move_up(pos)" do
      pending
      @mpd.move pos, pos-1
    end

    it "self.playlist_move_down(pos)" do
      pending
      @mpd.move pos, pos+1
    end

    it "self.playlist_remove(pos)" do
      pending
      @mpd.delete pos
    end

    ### State
    it "cur_track" do
      pending
      @mpd.current_song
    end

    it "cur_playlist" do
      pending
      @mpd.playlist
    end

    it "playing?" do
      pending
      @mpd.playing?
    end

    it "stopped?" do
      pending
      @mpd.stopped
    end

    it "repeat?" do
      pending
      @mpd.repeat?
    end
  end
end
