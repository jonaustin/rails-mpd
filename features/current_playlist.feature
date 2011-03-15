Feature: Current Playlist
  In order to be able to modify the current playlist
  As a user
  I want to manipulate the current playlist

  Background:
    Given I am on the current playlist page

  Scenario: Current playlist should show queued tracks
    Then The list of tracks in the current playlist section should be accurate
