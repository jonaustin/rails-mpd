class ApplicationController < ActionController::Base
  include Player

  before_filter :get_player

  def get_player
    if PLAYER_BACKEND == 'MPD'
      @player = MPDAbstract.new
    end
  end

  protect_from_forgery
end
