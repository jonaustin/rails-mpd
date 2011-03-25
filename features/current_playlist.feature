Feature: Current Playlist
  In order to be able to modify the current playlist
  As a user
  I want to manipulate the current playlist

  Background:
    Given I am on the current playlist page
    And There are at least 5 tracks
    And I should see the Track Number in the Album Track column
    And I should see the Song name in the Song column
    And I should see the Album name in the Album column
    And I should see the Artist name in the Artist column
    And I should see the song Duration in the Duration column
    And No song is currently playing
    # Put into Controls feature?
    And The controls set exists on the page


  Scenario: Playing a song
    When I start playing a song
    Then The controls should reflect the playing state
    And I should be able to view info for current song
    And The currently playing song's name should not be a link
    And The currently playing song's name in the playlist should match that in the Current Song Info
    
  # Controls
  Scenario: Play button
    When I click the play button
  #  Then It should play

  #Scenario: Stop button
  #  When I click the stop button
  #  Then It should stop

  #Scenario: Previous button
  #  When I click the previous button
  #  Then It should go to the previous track

  #Scenario: next button When I click the next button
  #  Then It should go to the next track

  ##play/pause
  ##repeat
