# == Schema Information
# Schema version: 20110521215759
#
# Table name: artists
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Artist < ActiveRecord::Base
  has_many :albums
  has_many :tracks
end
