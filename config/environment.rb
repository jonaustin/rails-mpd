# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Stratum::Application.initialize!

# App Constants
#MUSIC_DIR     = '/media/MORGOTH/musix'
MUSIC_DIR     = '/media/BAK/musix/shoegaze/cranes' # for testing
PLAYLIST_DIR  = '/var/lib/mpd/playlists/'
MPD_HOST      = 'localhost'
MPD_PORT      = 6600
