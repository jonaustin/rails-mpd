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
  pending # express the regexp above with the code you wish you had
end

When /^I start playing a song$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should be able to view info for current song$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^No song is currently playing$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^The controls set exists on the page$/ do
  page.should have_selector('div#controls')
end



When /^I start playing a song$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should be able to view info for current song$/ do
  pending # express the regexp above with the code you wish you had
end


