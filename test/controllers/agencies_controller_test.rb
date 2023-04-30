require "test_helper"

class AgenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agency = agencies(:one)
  end

  test "should get index" do
    get agencies_url
    assert_response :success
  end

  test "should show agency" do
    get agency_url(@agency)
    assert_response :success
  end
end
