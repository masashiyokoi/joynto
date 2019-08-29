require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "creating a Event" do
    visit events_url
    click_on "New Event"

    fill_in "Caption", with: @event.caption
    fill_in "Detail", with: @event.detail
    fill_in "End datetime", with: @event.end_datetime
    fill_in "Owner", with: @event.owner_id
    fill_in "Project", with: @event.project_id
    fill_in "Start datetime", with: @event.start_datetime
    fill_in "Url", with: @event.url
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit events_url
    click_on "Edit", match: :first

    fill_in "Caption", with: @event.caption
    fill_in "Detail", with: @event.detail
    fill_in "End datetime", with: @event.end_datetime
    fill_in "Owner", with: @event.owner_id
    fill_in "Project", with: @event.project_id
    fill_in "Start datetime", with: @event.start_datetime
    fill_in "Url", with: @event.url
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end
