module PlayerBackendAbstract
  if PLAYER_BACKEND == 'MPD'
    include MPDAbstract
  end
end
