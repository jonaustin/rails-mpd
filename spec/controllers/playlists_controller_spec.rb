require 'spec_helper'
require 'net/telnet'
# Only going to deal with MPD as a backend for now, so use net/telnet interface to verify.

describe PlaylistsController do

  describe "GET 'current'" do
    it "should be successful" do
      get 'current'
      response.should be_success
    end
  end

  context "modify current playlist" do
    it "should move the track up 1 in backend playlist when it receives the move_up() message" do
      pending
    end

    it "should move the track down 1 in backend playlist when it receives the move_down() message" do
      pending
    end

    it "should delete the track from backend playlist when it receives the remove() message" do
      pending
    end
  end

  context "modify play state" do
    before(:each) do
      @mpd_tn = Net::Telnet::new("Host"=>"127.0.0.1", "Timeout"=>25, "Output_log"=>"output_log.log", "Dump_log"=> "dump_log.log", "Port" => "7700", "Prompt"=>//)
    end
    
    after(:each) do
      @mpd_tn.close()
    end

    it "self.previous" do
      @mpd_tn.cmd('previous')
    end

    it "self.next" do
      @mpd_tn.cmd('next')
    end


    it "self.pause_play" do
      if @mpd_tn.cmd('stopped?')
        @mpd_tn.cmd('play 0')
      else
        @mpd_tn.cmd('pause = (@mpd.paused? ? false : true)')
      end
    end


    it "self.stop" do
      @mpd_tn.cmd('stop')
    end


    it "self.repeat" do
      @mpd_tn.cmd('repeat = (@mpd.repeat? ? false : true)')
    end

    it "self.playlist_move_up(pos)" do
      @mpd_tn.cmd('move pos, pos-1')
    end

    it "self.playlist_move_down(pos)" do
      @mpd_tn.cmd('move pos, pos+1')
    end

    it "self.playlist_remove(pos)" do
      @mpd_tn.cmd('delete pos')
    end

    ### State
    it "cur_track" do
      @mpd_tn.cmd('current_song')
    end

    it "cur_playlist" do
      @mpd_tn.cmd('playlist')
    end

    it "playing?" do
      @mpd_tn.cmd('playing?')
    end

    it "stopped?" do
      @mpd_tn.cmd('stopped')
    end

    it "repeat?" do
      @mpd_tn.cmd('repeat?')
    end
  end
end
