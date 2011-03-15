Feature: Player state
  In order to manipulate the behavior of the player
  As a user
  I want manipulate the various behaviors

  Background:
    Given Player connection is valid
    

  Scenario: Change currently playing track while another track is playing
    When I change to a different track
    Then It should play the new track

  Scenario: Change currently playing track while player is stopped
    When I play a track
    Then It should play that track

    


