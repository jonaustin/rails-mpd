# == Schema Information
# Schema version: 20110521215759
#
# Table name: tracks
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  number     :integer(4)
#  duration   :integer(4)
#  bitrate    :integer(4)
#  filename   :string(255)
#  artist_id  :integer(4)
#  album_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :playlists
  belongs_to :album
  belongs_to :artist

  validates_uniqueness_of :name, :scope => :album_id
end
