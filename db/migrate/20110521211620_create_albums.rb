class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.integer :artist_id
      t.string :name
      t.integer :year

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
