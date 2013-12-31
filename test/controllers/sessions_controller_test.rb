require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test 'github callback route' do
    assert_routing '/auth/github/callback',
      controller: 'sessions', action: 'create', provider: 'github'
  end

  def setup
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  end

  test 'successfully creates a user' do
    assert_difference('User.count') do
      post :create, provider: :github
    end
  end

  test "successfully create a session" do
    assert_nil session[:user_id]
    post :create, provider: :github
    assert_not_nil session[:user_id]
  end

  test "redirect the user to the root url" do
    post :create, provider: :github
    assert_redirected_to root_url
  end

  test 'auth failure displays error message' do
    get :failure
    assert flash[:error].present?
    assert_redirected_to root_path
  end

  test 'logout destroys the session' do
    session[:user_id] = 12345
    get :destroy
    refute session[:user_id]
    assert_equal 'Signed out!', flash[:notice]
    assert_redirected_to root_url
  end
end
