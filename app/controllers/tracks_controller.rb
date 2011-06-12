class TracksController < ApplicationController
  def sync_mpd
    mpd = @player.mpd
    mpd.connect
    tracks = mpd.songs
    tracks.each do |t|
      artist = Artist.find_or_create_by_name(t.artist)
      album  = Album.find_or_create_by_name(t.album) #FIXME: find by album/artist
      Track.create(:name => t.title, :number => t.track.split('/')[0], :duration => t.time, :filename => t.file)
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
