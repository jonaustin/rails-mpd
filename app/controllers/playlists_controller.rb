class PlaylistsController < ApplicationController
  def current
    @player
    @cur_playlist = @player.cur_playlist
  end

  def play
    @player.play params['pos']
    respond_to do |format|
      format.html do 
        if request.xhr?
          render :partial => "_partials/songinfo", :locals => { :cur_song => @player.cur_song }, :layout => false, :status => :created
        else
          redirect_to :action => 'current' 
        end
      end
    end
  end


  def previous
    @player.previous
    respond_to do |format|
      format.html do 
        if request.xhr?
          render :partial => "_partials/songinfo", :locals => { :cur_song => @player.cur_song }, :layout => false, :status => :created
        else
          redirect_to :action => 'current' 
        end
      end
    end
  end

  def next
    @player.next
    respond_to do |format|
      format.html do 
        if request.xhr?
          render :partial => "_partials/songinfo", :locals => { :cur_song => @player.cur_song }, :layout => false, :status => :created
        else
          redirect_to :action => 'current' 
        end
      end
    end
  end


  def pause_play
    @player.pause_play
    respond_to do |format|
      format.html do 
        if request.xhr?
          render :partial => "_partials/songinfo", :locals => { :cur_song => @player.cur_song }, :layout => false, :status => :created
        else
          redirect_to :action => 'current' 
        end
      end
    end
  end


  def stop
    @player.stop
    respond_to do |format|
      format.html do 
        if request.xhr?
          render :partial => "_partials/songinfo", :locals => { :cur_song => @player.cur_song }, :layout => false, :status => :created
        else
          redirect_to :action => 'current' 
        end
      end
    end
  end


  def repeat
    @player.repeat = (@player.repeat? ? false : true)
    redirect_to :action => 'current'
  end

  ### Playlist Actions
  def move_up
    pos = params['pos'].to_i
    @player.move pos, pos-1
    redirect_to :action => 'current'
  end

  def move_down
    pos = params['pos'].to_i
    @player.move pos, pos+1
    redirect_to :action => 'current'
  end

  def remove
    pos = params['pos'].to_i
    @player.delete pos
    redirect_to :action => 'current'
  end


end
