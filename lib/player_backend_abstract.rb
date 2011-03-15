module PlayerBackendAbstract
  if PLAYER_BACKEND == 'MPD'
    include MPDAbstract
    @player = MPDAbstract
  end
end
