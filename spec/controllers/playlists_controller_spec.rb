require 'spec_helper'
require 'net/telnet'
# Only going to deal with MPD as a backend for now, so use net/telnet interface to verify.
include Player

describe PlaylistsController do
  context "current playlist" do
    describe "GET 'current'" do
      before(:each) do
        get 'current'
      end

      it "should be successful" do
        response.should be_success
      end

      it "should assign @player" do
        assigns[:player].should be_instance_of(MPDAbstract)
      end

      it "should assign @cur_playlist" do
        assigns[:cur_playlist].should be_instance_of(Array)
      end
    end

    context "modify state" do
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
  end
end
