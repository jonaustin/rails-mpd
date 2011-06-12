# == Schema Information
# Schema version: 20110521215759
#
# Table name: genres
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  id3_id     :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Genre < ActiveRecord::Base
  has_and_belongs_to_many :tracks
end
