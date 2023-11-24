require "test_helper"

class EventAttendingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_attendings_index_url
    assert_response :success
  end
end
