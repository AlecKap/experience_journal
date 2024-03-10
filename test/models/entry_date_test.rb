require "test_helper"
class EntryDateTest < ActiveSupport::TestCase
  test "#previous_date returns the quote's previous date when it exitsts" do
    assert_equal entry_dates(:today), entry_dates(:next_week).previous_date
  end

  test "#previous_date returns nil when the quote has no previous date" do
    assert_nil entry_dates(:today).previous_date
  end
end
