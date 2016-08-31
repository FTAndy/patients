# == Schema Information
#
# Table name: locations
#
#  id   :integer          not null, primary key
#  code :string(10)       not null
#  name :string(80)
#

class Location < ActiveRecord::Base
  has_many :patients

  validates :name, presence: true
end
