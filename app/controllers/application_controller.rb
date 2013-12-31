class ApplicationController < ActionController::Base
  include Pundit

  # Verify that controller actions are authorized. Optional, but good.
  # after_filter :verify_authorized, except: :index
  # after_filter :verify_policy_scoped, only: :index

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :current_user

  helper_method :logged_in?
  helper_method :current_user

  protected
  def current_user
    @current_user ||= User.find(session[:user_id]) if session.has_key?(:user_id)
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
  end

  def current_user?
    !!current_user
  end

  def logged_in?
    current_user?
  end

  def authenticate_user!
    if session.has_key?(:user_id)
      current_user
    else
      redirect_to redirect_path
    end
  end

  def logout!
    @current_user = nil
    reset_session
  end

  def redirect_path
    :root
  end

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to request.headers["Referer"] || root_path
  end
end
