require 'spec_helper'

describe Player do
  context "MPD Player" do
    describe "modify play state" do
      before(:all) do
        require 'net/telnet'
      end
      before(:each) do
        @player = Player::MPDAbstract.new # change to let?
      end

      it "should connect when receiving connect() message" do
        @player.disconnect if @player.connected?
        @player.connect
        @player.connected?.should be_true
        @player.disconnect
      end

      it "should play if stopped when receiving play() message" do
        @player.stop if @player.playing?
        @player.play(0)
        @player.playing?.should be_true
      end

      it "should play if paused when receiving pause_play() message" do
        @player.pause if @player.playing?
        @player.paused?.should be_true
      end

      it "should pause if playing when receiving pause_play() message" do
        @player.pause_play if @player.playing?
        @player.paused?.should be_true
      end

      context "for next and previous" do
        before(:each) do
          @start_pos = 1
          @player.play(@start_pos)
          @player.playing?.should be_true
          pos = @player.playlist_pos
          pos.should eq(1) # test position after playing at specific pos
        end

        it "should go to previous track when receiving previous() message" do
          @player.previous
          pos = @player.playlist_pos
          pos.should eq(@start_pos-1) # test position after switching to previous
        end

        it "self.next" do
          @player.next
          pos = @player.playlist_pos
          pos.should eq(@start_pos+1) # test position after switching to previous
        end
      end

      it "self.stop" do
        pending
        @player.stop
      end


      it "self.repeat" do
        pending
        @player.repeat = (@player.repeat? ? false : true)
      end

      it "self.playlist_move_up(pos)" do
        pending
        @player.move pos, pos-1
      end

      it "self.playlist_move_down(pos)" do
        pending
        @player.move pos, pos+1
      end

      it "self.playlist_remove(pos)" do
        pending
        @player.delete pos
      end

      ### State
      it "cur_track" do
        pending
        @player.current_song
      end

      it "cur_playlist" do
        pending
        @player.playlist
      end

      it "playing?" do
        pending
        @player.playing?
      end

      it "stopped?" do
        pending
        @player.stopped
      end

      it "repeat?" do
        pending
        @player.repeat?
      end
    end
  end
end
