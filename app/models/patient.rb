# == Schema Information
#
# Table name: patients
#
#  id            :integer          not null, primary key
#  first_name    :string(30)       not null
#  middle_name   :string(10)
#  last_name     :string(30)       not null
#  date_of_birth :date
#  gender        :string
#  status        :string           not null
#  viewed_count  :integer          default("0")
#  location_id   :integer          default("1"), not null
#  deleted       :boolean          default("f")
#

class Patient < ActiveRecord::Base
  extend Enumerize
  enumerize :gender, in: [:not_available, :male, :female]
  enumerize :status, in: [:initial, :referred, :treatment, :closed]

  belongs_to :location

  validates :first_name, :last_name, :status, :location_id, presence: true

  validates :viewed_count, numericality: { greater_than_or_equal_to: 0}

  scope :onTreatment, -> { where(status: 'treatment') }

  def mr
    mr = self.id.to_s
    id_size = self.id.to_s.length
    padding_zero = 6 - id_size
    padding_zero.times { mr.insert(0, '0') }
    return mr
  end

  def full_name
    self.first_name.to_s + " " + self.middle_name.to_s + " " + self.last_name.to_s
  end

  def age
    DateTime.now.year - self.date_of_birth.year
  end
end
