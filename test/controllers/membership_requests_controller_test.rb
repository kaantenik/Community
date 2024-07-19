require "test_helper"

class MembershipRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @membership_request = membership_requests(:one)
  end

  test "should get index" do
    get membership_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_membership_request_url
    assert_response :success
  end

  test "should create membership_request" do
    assert_difference("MembershipRequest.count") do
      post membership_requests_url, params: { membership_request: { approved: @membership_request.approved, club_id: @membership_request.club_id, user_id: @membership_request.user_id } }
    end

    assert_redirected_to membership_request_url(MembershipRequest.last)
  end

  test "should show membership_request" do
    get membership_request_url(@membership_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_membership_request_url(@membership_request)
    assert_response :success
  end

  test "should update membership_request" do
    patch membership_request_url(@membership_request), params: { membership_request: { approved: @membership_request.approved, club_id: @membership_request.club_id, user_id: @membership_request.user_id } }
    assert_redirected_to membership_request_url(@membership_request)
  end

  test "should destroy membership_request" do
    assert_difference("MembershipRequest.count", -1) do
      delete membership_request_url(@membership_request)
    end

    assert_redirected_to membership_requests_url
  end
end
