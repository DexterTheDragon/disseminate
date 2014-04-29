require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  should belong_to(:group)

  test "should format a display_name" do
    class TestService < Service; end

    assert_equal 'Test', TestService.display_name
  end
end
