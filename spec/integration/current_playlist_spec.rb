require 'spec_helper'

describe Player do
  describe "MPD" do
    context "when modifying the play state" do
      before(:all) do
        visit current_playlist_path
      end

      before(:each) do
        mpd = MPD.new MPD_HOST, MPD_PORT
        mpd.connect
        mpd.add mpd.directories.first
      end

      it "should show correct number of tracks" do
        page.should have_selector('div#current_playlist')
        page.should have_selector('tr.song', :minimum => 5)
      end

      it "should have track number in album track column" do
        save_and_open_page
        page.should have_selector('tr.song td.tracknum')
      end

      it "should have the Song name in the Song column" do
        page.should have_selector('tr.song td.song_name')
        page.should have_selector('tr.song a.song_name')
      end

      it "should have the Album name in the Album column" do
        page.should have_selector('tr.song td.album_name')
      end

      it "should have the Artist name in the Artist column" do
        page.should have_selector('tr.song td.artist_name')
      end

      it "should have the song Duration in the Duration column" do
        page.should have_selector('tr.song td.duration')
      end

      it "No song is currently playing" do
        visit stop_path
        page.should_not have_selector('a#stop')
      end

      it "The controls set exists on the page" do
        page.should have_selector('div#controls')
      end

    end
  end
end
