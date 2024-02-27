require "application_system_test_case"

class ExperiencesTest < ApplicationSystemTestCase
  setup do
    @experience = experiences(:first) # Reference to the first fixture experience
  end
  test "Creating a new experience" do
    # When we visit the experiences#index page
    # we expect to see a title with the text "experiences"
    visit experiences_path
    assert_selector "h1", text: "experiences"

    # When we click on the link with the text "New experience"
    # we expect to land on a page with the title "New experience"
    click_on "New experience"
    assert_selector "h1", text: "New experience"

    # When we fill in the name input with "Capybara experience"
    # and we click on "Create experience"
    fill_in "Name", with: "Capybara experience"
    click_on "Create experience"

    # We expect to be back on the page with the title "experiences"
    # and to see our "Capybara experience" added to the list
    assert_selector "h1", text: "experiences"
    assert_text "Capybara experience"
  end

  test "Showing a experience" do
    visit experiences_path
    click_link @experience.name

    assert_selector "h1", text: @experience.name
  end

  test "Updating a experience" do
    visit experiences_path
    assert_selector "h1", text: "experiences"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit experience"

    fill_in "Name", with: "Updated experience"
    click_on "Update experience"

    assert_selector "h1", text: "experiences"
    assert_text "Updated experience"
  end

  test "Destroying a experience" do
    visit experiences_path
    assert_text @experience.name

    click_on "Delete", match: :first
    assert_no_text @experience.name
  end
end
