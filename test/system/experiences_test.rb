require "application_system_test_case"

class ExperiencesTest < ApplicationSystemTestCase
  setup do
    @experience = Experience.ordered.first
  end

  test "Showing an experience" do
    visit experiences_path
    click_link @experience.name

    assert_selector "h1", text: @experience.name
  end

  test "Creating a new experience" do
    visit experiences_path
    assert_selector "h1", text: "Experiences"

    click_on "New Experience"
    fill_in "Name", with: "Capybara experience"
    
    assert_selector "h1", text: "Experience"
    click_on "Create experience"

    assert_selector "h1", text: "Experiences"
    assert_text "Capybara experience"
  end

  test "Updating an experience" do
    visit experiences_path
    assert_selector "h1", text: "Experiences"
    
    click_on "Edit", match: :first
    fill_in "Name", with: "Updated experience"
    
    assert_selector "h1", text: "Experiences"
    click_on "Update experience"

    assert_selector "h1", text: "Experiences"
    assert_text "Updated experience"
  end

  test "Destroying an experience" do
    visit experiences_path
    assert_text @experience.name

    click_on "Delete", match: :first
    assert_no_text @experience.name
  end
end
