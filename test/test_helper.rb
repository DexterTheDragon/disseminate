require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start 'rails'

ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  OmniAuth.config.test_mode = true
  omniauth_hash = {
    'provider' => 'github',
    'uid' => '12345',
    'info' => {
      'name' => 'Bugs Bunny',
      'email' => 'bugsbunny@example.com',
      'nickname' => 'bugsbunny'
    },
    'extra' => {
      'raw_info' => {
        'location' => 'San Francisco',
        'gravatar_id' => '123456789'
      }
    }
  }
  OmniAuth.config.add_mock(:github, omniauth_hash)
end

class ActionController::TestCase
  def json
    ActiveSupport::JSON.decode @response.body
  end
end

class PolicyTest < ActiveSupport::TestCase
  def permit(current_user, record, action)
    policy_class.new(current_user, record).public_send("#{action}?")
  end

  def forbid(current_user, record, action)
    !permit(current_user, record, action)
  end

  def policy_class
    self.class.to_s.gsub(/Test/, '').constantize
  end
end
