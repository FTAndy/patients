require 'test_helper'

class PatientsIndexTest < ActionDispatch::IntegrationTest

  test "index page" do
    get "/"
    assert_select "h1", "Patients List"
  end

  test "create patient" do
    get '/patients/new'
    assert_select "h1", "New Patient"

    post '/patients', patient: { first_name: 'a', last_name: 'a', date_of_birth: Date.new(1994), gender: 'male', status: 'initial', location_id: 1}
    assert_equal Patient.find(2).first_name, 'a'
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Patients List"
  end

  test "update patient" do
    get '/patients/1/edit'
    assert_select "h1", "Edit Patient MR000001"
    patch '/patients/1', patient: { first_name: 'a', last_name: 'a', date_of_birth: Date.new(1994), gender: 'male', status: 'initial', location_id: 1}
    assert_response :redirect
    assert_equal Patient.first.first_name, 'a'
    follow_redirect!
    assert_response :success
    assert_select "h1", "Patients List"
  end

  test "view patient" do
    @patient = Patient.first
    get patient_path(@patient)
    assert_response :success
    assert_select "h1", "Patient MR000001"
    assert_select "b", "1"
  end

  test "delete patient" do
    @patient = Patient.first
    delete patient_path(@patient)
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'table' do
      assert_select 'td', false
    end
  end

  test "deleted patients list" do
    get root_path(deleted: true)
    assert_select 'table' do
      assert_select 'td', false
    end
  end

  test "location page" do
    get location_path(Location.first)
    assert_select "h1", "Test Location 1"
  end

  test "change local language" do
    get root_path
    assert_select "h1", "Patients List"
    get request.original_url.to_s.gsub(/\?(.*)/, '') + "/?locale=zh-cn"
    assert_select "h1", '病历列表'
  end


end
