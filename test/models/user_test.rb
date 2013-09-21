require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'create_with_omniauth' do
    auth = {
      'provider' => 'github',
      'uid' => '123456789',
      'info' => {
        'name' => 'Bugs Bunny',
        'email' => 'bbunny@example.net',
      },
    }
    user = User.create_with_omniauth(auth)
    assert user
  end
end
