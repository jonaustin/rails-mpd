class CreateGenres < ActiveRecord::Migration
  def self.up
    create_table :genres do |t|
      t.string :name
      t.integer :id3_id

      t.timestamps
    end
  end

  def self.down
    drop_table :genres
  end
end
