require "test_helper"

module Owner
  class AgenciesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @agency = agencies(:johns_co)
      sign_in users(:john)
    end

    test "should get dashboard" do
      get owner_agency_dashboard_path(@agency)
      assert_response :success
    end

    test "should get new" do
      get new_owner_agency_url(@agency)
      assert_response :success
    end

    test "should create agency" do
      assert_difference("Agency.count") do
        post owner_agencies_url, params: {
          agency: {
            latitude: @agency.latitude,
            longitude: @agency.longitude,
            name: @agency.name,
            pitch: @agency.pitch
          }
        }
      end

      assert_redirected_to owner_agency_url(Agency.last)
    end

    test "should show agency" do
      get owner_agency_path(@agency)
      assert_response :success
    end

    test "should get edit" do
      get edit_owner_agency_url(@agency)
      assert_response :success
    end

    test "should update agency" do
      patch owner_agency_url(@agency), params: {
        agency: {
          latitude: @agency.latitude,
          longitude: @agency.longitude,
          name: @agency.name,
          pitch: @agency.pitch
        }
      }
      assert_redirected_to owner_agency_url(@agency)
    end

    test "should destroy agency" do
      assert_difference("Agency.count", -1) do
        delete owner_agency_url(@agency)
      end

      assert_redirected_to owner_agencies_url
    end
  end
end
