require 'spec_helper'

describe TracksController do

  describe "GET 'sync_mpd'" do
    it "should be successful" do
      get 'sync_mpd'
      response.should be_success
    end
  end

end
