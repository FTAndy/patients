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

require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  test 'should not save without first_name last_name status' do
    patient = Patient.new(last_name: 's', status: 'initial', location_id: 1)
    assert_not patient.save, 'there is no first name'

    patient = Patient.new(first_name: 's', status: 'initial', location_id: 1)
    assert_not patient.save, 'there is no last name'

    patient = Patient.new(first_name: 's', last_name: 's', location_id: 1)
    assert_not patient.save, 'there is no status'

  end

  test 'gender should be female, male or not available' do
    patient = Patient.new(first_name: 's', last_name: 's', status: 'initial', location_id: 1, gender: 'sdsds')
    assert_not patient.save, 'wrong gender'

    patient = Patient.new(first_name: 's', last_name: 's', status: 'initial', location_id: 1, gender: 'female')
    assert patient.save, 'right female gender'

    patient = Patient.new(first_name: 's', last_name: 's', status: 'initial', location_id: 1, gender: 'male')
    assert patient.save, 'right male gender'

    patient = Patient.new(first_name: 's', last_name: 's', status: 'initial', location_id: 1, gender: 'not_available')
    assert patient.save, 'right not available gender'
  end

  test 'status should be initial, referred, treatment or closed' do
    patient = Patient.new(first_name: 's', last_name: 's', location_id: 1, status: 'asds')
    assert_not patient.save, 'wrong status'

    patient = Patient.new(first_name: 's', last_name: 's', location_id: 1, status: 'initial')
    assert patient.save, 'right initial status'

    patient = Patient.new(first_name: 's', last_name: 's', location_id: 1, status: 'referred')
    assert patient.save, 'right referred status'

    patient = Patient.new(first_name: 's', last_name: 's', location_id: 1, status: 'treatment')
    assert patient.save, 'right treatment status'

    patient = Patient.new(first_name: 's', last_name: 's', location_id: 1, status: 'closed')
    assert patient.save, 'right closed status'
  end

  test 'build right relation with location' do
    patient = Patient.create(first_name: 's', last_name: 's', location_id: 1, status: 'initial')
    assert_equal Location.first.patients.last, patient
  end

end
