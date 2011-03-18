require 'spec_helper'

describe Player do
  describe "MPD" do
    context "when modifying the play state" do
      before(:all) do
        require 'net/telnet'
      end
      before(:each) do
        @player = Player::MPDAbstract.new # change to let?
      end

      context "to connect or disconnect" do
        it "should connect when receiving connect() message" do
          @player.disconnect if @player.connected?
          @player.connect
          @player.connected?.should be_true
          @player.disconnect
        end

        it "should disconnect when receiving disconnect() message" do
          @player.connect unless @player.connected?
          @player.disconnect
          @player.connected?.should be_false
          @player.disconnect
        end
      end

      context "to play/pause/stop playback" do
        it "should play when receiving play() message" do
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

        it "should stop when receiving stop() message" do
          @player.play(0) if @player.stopped?
          @player.stop
          @player.playing?.should be_false
        end

        context "for repeat/random state" do
          it "should switch repeat state when receiving repeat() message" do
            initial_repeat = @player.repeat?
            @player.repeat
            new_repeat = @player.repeat?
            new_repeat.should_not eq(initial_repeat)
          end
        end
      end

      context "for next or previous" do
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

        it "should go to the next track when receiving next() message" do
          @player.next
          pos = @player.playlist_pos
          pos.should eq(@start_pos+1) # test position after switching to previous
        end
      end


    end
  end
end
