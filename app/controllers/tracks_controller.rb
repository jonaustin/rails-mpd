class TracksController < ApplicationController
  def sync_mpd
    #FIXME: remove tracks that no longer exist in mpd
    mpd = @player.mpd
    mpd.connect
    tracks = mpd.songs
    tracks.each do |t|
      next if t.nil?
      logger.info t.attributes.to_s
      artist = Artist.find_or_create_by_name(t.artist)
      album  = Album.find_or_create_by_name(t.album) #FIXME: find by album/artist
      number = t.track.split('/')[0] unless t.track.nil?
      Track.create(:name => t.title, :number => number, :duration => t.time, :filename => t.file, :artist_id => artist.id, :album_id => album.id)
    end
    message = "MPD synced:  #{Track.count} tracks"

    respond_to do |format|
      format.html do
        if request.xhr?
          render :js => message, :layout => false, :status => 200
        else
          flash[:notice] = message
          redirect_to "/current"
        end
      end
    end
  end

end
