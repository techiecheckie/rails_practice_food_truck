require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = locations(:one)
  end

  test "should get index" do
    get locations_url, as: :json
    json_response = JSON.parse(response.body)
    assert_equal 2, json_response.length
    assert_equal "Kensington Library", json_response[1]['name']
    assert_response :success
  end

  test "should get new" do
    get new_location_url
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post locations_url, params: { location: { lat: @location.lat, long: @location.long, name: @location.name, start_time: @location.start_time, end_time: @location.end_time } }
    end

    assert_redirected_to location_url(Location.last)
  end

  test "should show location" do
    get location_url(@location)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_url(@location)
    assert_response :success
  end

  test "should update location" do
    patch location_url(@location), params: { location: { lat: @location.lat, long: @location.long, name: @location.name, start_time: @location.start_time, end_time: @location.end_time } }
    assert_redirected_to location_url(@location)
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete location_url(@location)
    end

    assert_redirected_to locations_url
  end
end
