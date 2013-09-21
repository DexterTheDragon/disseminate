class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new; end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def failure
    flash[:error] = I18n.t('notifications.authentication_error')
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
