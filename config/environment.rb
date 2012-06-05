# Load the rails application
require File.expand_path('../application', __FILE__)

# App Constants (will eventually move into user web prefs)
PLAYER_BACKEND = 'MPD'
#MUSIC_DIR     = '/media/MORGOTH/musix'
MUSIC_DIR     = '/home/jon/.mpd_local/music' # for testing
PLAYLIST_DIR  = '/home/jon/.mpd_local/playlists'
MPD_HOST      = 'xs.homeunix.net'
MPD_PORT      = 20000

# Initialize the rails application
Stratum::Application.initialize!
