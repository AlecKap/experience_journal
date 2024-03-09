require "test_helper"
class EventDateTest < ActiveSupport::TestCase
  test "#previous_date returns the quote's previous date when it exitsts" do
    assert_equal event_dates(:today), event_dates(:next_week).previous_date
  end

  test "#previous_date returns nil when the quote has no previous date" do
    assert_nil event_dates(:today).previous_date
  end
end
