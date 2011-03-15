require 'spec_helper'

describe PlaylistsController do

  describe "GET 'current'" do
    it "should be successful" do
      get 'current'
      response.should be_success
    end
  end

  describe "Modify Current Playlist" do
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
