require 'spec_helper'

describe TracksController do

  describe "GET 'sync_mpd'" do
    pending 'fix..was failing in rails 3.1 as well'
    it "should be successful" do
      pending
      get 'sync_mpd'
      response.should be_success
    end
  end

end
