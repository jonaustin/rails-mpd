require 'spec_helper'

describe ApplicationController do
  context "MPD Abstract class" do
    describe "modify play state" do
      before(:all) do
        require 'net/telnet'
      end

      it "should return a @player that is r valid instance of PLAYER_BACKEND" do
        pending
        appc = ApplicationController.new
        @player = appc.get_player
        @player.should_be instance_of(MPD)
      end
    end
  end
end

