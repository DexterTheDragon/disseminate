require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:services)
  should validate_presence_of(:name)
end
