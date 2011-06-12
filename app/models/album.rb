# == Schema Information
# Schema version: 20110521215759
#
# Table name: albums
#
#  id         :integer(4)      not null, primary key
#  artist_id  :integer(4)
#  name       :string(255)
#  year       :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base
  has_many :tracks
  belongs_to :artist
end
