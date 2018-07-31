require 'test_helper'

class RoombookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @roombooking = roombookings(:one)
  end

  test "should get index" do
    get roombookings_url
    assert_response :success
  end

  test "should get new" do
    get new_roombooking_url
    assert_response :success
  end

  test "should create roombooking" do
    assert_difference('Roombooking.count') do
      post roombookings_url, params: { roombooking: { endtime: @roombooking.endtime, roomid: @roombooking.roomid, starttime: @roombooking.starttime } }
    end

    assert_redirected_to roombooking_url(Roombooking.last)
  end

  test "should show roombooking" do
    get roombooking_url(@roombooking)
    assert_response :success
  end

  test "should get edit" do
    get edit_roombooking_url(@roombooking)
    assert_response :success
  end

  test "should update roombooking" do
    patch roombooking_url(@roombooking), params: { roombooking: { endtime: @roombooking.endtime, roomid: @roombooking.roomid, starttime: @roombooking.starttime } }
    assert_redirected_to roombooking_url(@roombooking)
  end

  test "should destroy roombooking" do
    assert_difference('Roombooking.count', -1) do
      delete roombooking_url(@roombooking)
    end

    assert_redirected_to roombookings_url
  end
end
