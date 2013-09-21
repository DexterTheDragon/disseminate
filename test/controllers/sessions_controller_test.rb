require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'github callback route' do
    assert_routing '/auth/github/callback',
      controller: 'sessions', action: 'create', provider: 'github'
  end
end
