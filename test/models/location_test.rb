# == Schema Information
#
# Table name: locations
#
#  id   :integer          not null, primary key
#  code :string(10)
#  name :string(80)       not null
#

require 'test_helper'

class PatientTest < ActiveSupport::TestCase

  test "should not be saved without name" do
    location = Location.new(code: 'sdsd')
    assert_not location.save, 'without name'

    location = Location.new(name: 'sdsd')
    assert location.save, 'with name save'
  end

  test 'has relationship with patient' do
    assert_equal Patient.first, Location.first.patients.first
  end

end
