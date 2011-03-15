Then /^The list of tracks in the current playlist section should be accurate$/ do
  visit current_playlist_path
  page.should have_selector('div#current_playlist')
end
