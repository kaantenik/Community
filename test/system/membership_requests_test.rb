require "application_system_test_case"

class MembershipRequestsTest < ApplicationSystemTestCase
  setup do
    @membership_request = membership_requests(:one)
  end

  test "visiting the index" do
    visit membership_requests_url
    assert_selector "h1", text: "Membership requests"
  end

  test "should create membership request" do
    visit membership_requests_url
    click_on "New membership request"

    check "Approved" if @membership_request.approved
    fill_in "Club", with: @membership_request.club_id
    fill_in "User", with: @membership_request.user_id
    click_on "Create Membership request"

    assert_text "Membership request was successfully created"
    click_on "Back"
  end

  test "should update Membership request" do
    visit membership_request_url(@membership_request)
    click_on "Edit this membership request", match: :first

    check "Approved" if @membership_request.approved
    fill_in "Club", with: @membership_request.club_id
    fill_in "User", with: @membership_request.user_id
    click_on "Update Membership request"

    assert_text "Membership request was successfully updated"
    click_on "Back"
  end

  test "should destroy Membership request" do
    visit membership_request_url(@membership_request)
    click_on "Destroy this membership request", match: :first

    assert_text "Membership request was successfully destroyed"
  end
end
