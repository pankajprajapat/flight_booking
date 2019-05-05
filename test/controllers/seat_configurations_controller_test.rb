require 'test_helper'

class SeatConfigurationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seat_configuration = seat_configurations(:one)
  end

  test "should get index" do
    get seat_configurations_url
    assert_response :success
  end

  test "should get new" do
    get new_seat_configuration_url
    assert_response :success
  end

  test "should create seat_configuration" do
    assert_difference('SeatConfiguration.count') do
      post seat_configurations_url, params: { seat_configuration: { category_id: @seat_configuration.category_id, number_of_rows: @seat_configuration.number_of_rows, plane_id: @seat_configuration.plane_id, seats_in_row: @seat_configuration.seats_in_row } }
    end

    assert_redirected_to seat_configuration_url(SeatConfiguration.last)
  end

  test "should show seat_configuration" do
    get seat_configuration_url(@seat_configuration)
    assert_response :success
  end

  test "should get edit" do
    get edit_seat_configuration_url(@seat_configuration)
    assert_response :success
  end

  test "should update seat_configuration" do
    patch seat_configuration_url(@seat_configuration), params: { seat_configuration: { category_id: @seat_configuration.category_id, number_of_rows: @seat_configuration.number_of_rows, plane_id: @seat_configuration.plane_id, seats_in_row: @seat_configuration.seats_in_row } }
    assert_redirected_to seat_configuration_url(@seat_configuration)
  end

  test "should destroy seat_configuration" do
    assert_difference('SeatConfiguration.count', -1) do
      delete seat_configuration_url(@seat_configuration)
    end

    assert_redirected_to seat_configurations_url
  end
end
