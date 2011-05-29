class CreateGenresTracks < ActiveRecord::Migration
  def self.up
    create_table :genres_tracks, :id => false do |t|
      t.string :genre_id
      t.string :track_id
    end
  end

  def self.down
    drop_table :genres_tracks
  end
end
