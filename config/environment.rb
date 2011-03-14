# Load the rails application
require File.expand_path('../application', __FILE__)

# App Constants (will eventually move into user web prefs)
PLAYER_BACKEND = 'MPD'
#MUSIC_DIR     = '/media/MORGOTH/musix'
MUSIC_DIR     = '/home/jon/.mpd_local/music' # for testing
PLAYLIST_DIR  = '/home/jon/.mpd_local/playlists'
MPD_HOST      = 'localhost'
MPD_PORT      = 6600

# Initialize the rails application
Stratum::Application.initialize!

