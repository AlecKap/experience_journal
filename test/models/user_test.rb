require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "name" do
    assert_equal "Alec", users(:alec).name
  end
end
