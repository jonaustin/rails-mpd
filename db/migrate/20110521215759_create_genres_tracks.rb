class CreateGenresTracks < ActiveRecord::Migration
  def self.up
    create_table :genres_tracks do |t|
      t.string :genre_id
      t.string :track_id
    end
    remove_column :genres_tracks, :id
  end

  def self.down
    drop_table :genres_tracks
  end
end
