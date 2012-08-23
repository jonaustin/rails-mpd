require 'spec_helper'

describe Player do
  describe "MPD" do
    context "when modifying the play state" do
      before(:each) do
        @mpd = MPD.new MPD_HOST, MPD_PORT
        @player = Player::MPDAbstract.new(@mpd)
      end

      context "to connect or disconnect" do
        it "should connect when receiving connect message" do
          @player.disconnect if @player.connected?
          @player.connect
          @player.connected?.should be_true
          @player.disconnect
        end

        it "should disconnect when receiving disconnect message" do
          @player.connect unless @player.connected?
          @player.disconnect
          @player.connected?.should be_false
          @player.disconnect
        end
      end

      context "to play/pause/stop playback" do
        it "should play when receiving play message" do
          @player.mpd.should_receive(:play).with(0).once
          @player.play(0)
        end

        it "should play if paused when receiving pause_play message" do
          @player.stub(:playing?).and_return false
          @player.mpd.should_receive(:play).once
          @player.play unless @player.playing?
        end

        it "should pause if playing when receiving pause_play message" do
          @player.stub(:playing?).and_return true
          @player.mpd.should_receive(:pause).once
          @player.pause if @player.playing?
        end

        context "for repeat/random state" do
          it "should switch repeat state when receiving repeat message" do
            mpd = double()
            mpd.stub(:repeat?).and_return false
            player = Player::MPDAbstract.new(mpd)
            mpd.should_receive(:repeat=).with(true)
            player.repeat
          end
        end
      end

    end
  end
end
