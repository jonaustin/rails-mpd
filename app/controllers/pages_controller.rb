class PagesController < ApplicationController
  def home
    @player.pause_play
  end
end
