require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  should belong_to(:user)
  should validate_presence_of(:name)
end
