class PlayerController < ApplicationController
  def play
    @player.play params['pos']
    respond_to do |format|
      format.html do
        if request.xhr?
          render :partial => "_partials/songinfo", :locals => { :cur_song => @player.cur_song }, :layout => false, :status => 200
        else
          redirect_to  '/current'
        end
      end
    end
  end


  def previous
    @player.previous
    respond_to do |format|
      format.html do
        if request.xhr?
          render :partial => "_partials/songinfo", :locals => { :cur_song => @player.cur_song }, :layout => false, :status => 200
        else
          redirect_to  '/current'
        end
      end
    end
  end

  def next
    @player.next
    respond_to do |format|
      format.html do
        if request.xhr?
          render :partial => "_partials/songinfo", :locals => { :cur_song => @player.cur_song }, :layout => false, :status => 200
        else
          redirect_to  '/current'
        end
      end
    end
  end


  def pause_play
    @player.pause_play
    respond_to do |format|
      format.html do
        if request.xhr?
          render :partial => "_partials/songinfo", :locals => { :cur_song => @player.cur_song }, :layout => false, :status => 200
        else
          redirect_to  '/current'
        end
      end
    end
  end


  def stop
    @player.stop
    respond_to do |format|
      format.html do
        if request.xhr?
          render :partial => "_partials/songinfo", :locals => { :cur_song => @player.cur_song }, :layout => false, :status => 200
        else
          redirect_to  '/current'
        end
      end
    end
  end


  def repeat
    @player.repeat = (@player.repeat? ? false : true)
    redirect_to  '/current'
  end

  ### Playlist Actions
end
