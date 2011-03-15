class PagesController < ApplicationController
  include PlayerBackendAbstract

  def home
    MPDAbstract.pause_play
  end

end
