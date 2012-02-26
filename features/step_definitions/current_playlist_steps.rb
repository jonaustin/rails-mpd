# Background
Given /^There are at least (\d+) tracks$/ do |arg1|
  #visit current_playlist_path
  page.should have_selector('div#current_playlist')
  page.should have_selector('tr.song', :minimum => 5)
end

Given /^I should see the Track Number in the Album Track column$/ do
  page.should have_selector('tr.song td.tracknum')
end

Given /^I should see the Song name in the Song column$/ do
  page.should have_selector('tr.song td.song_name')
  page.should have_selector('tr.song a.song_name')
end

Given /^I should see the Album name in the Album column$/ do
  page.should have_selector('tr.song td.album_name')
end

Given /^I should see the Artist name in the Artist column$/ do
  page.should have_selector('tr.song td.artist_name')
end

Given /^I should see the song Duration in the Duration column$/ do
  page.should have_selector('tr.song td.duration')
end

Given /^No song is currently playing$/ do
  visit stop_path
  page.should_not have_selector('a#stop')
end

Given /^The controls set exists on the page$/ do
  page.should have_selector('div#controls')
end


# Playing a song
When /^I start playing a song$/ do
  visit play_path
end

Then /^The controls should reflect the playing state$/ do
  page.should have_selector('a#stop')
  page.should have_selector('a#pause')
end

Then /^I should be able to view info for current song$/ do
  page.should have_selector('ul#current_info')
  page.should have_selector('ul#current_info li') # not currently putting a count or minimum as this can change from song to song (i.e. will a song with no id3 tags even have any?)
end

Then /^The currently playing song's name should not be a link$/ do
  playlist_pos = find('#current_pos').text.lstrip.rstrip # remove newlines from start and end
  playlist_pos = playlist_pos.split(' = ')[1] # get num from 'pos = 12'
  page.should_not have_selector('a#cur_playlist_track__'+playlist_pos)
end

Then /^The currently playing song's name in the playlist should match that in the Current Song Info$/ do
  cur_song_name = find('#current_title').text.lstrip.rstrip # remove newlines from start and end
  cur_song_name = cur_song_name.split(' = ')[1]
  find('span#playlist_cur_song_name').text.should == cur_song_name
end


# Controls
When /^I click the play button$/ do
  visit stop_path
  page.should have_selector('a#play')
  page.click_link('play')
end

#Then /^It should play/ do
#end
