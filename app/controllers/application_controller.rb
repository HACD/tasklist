class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_sign_in

  def check_sign_in
    if !user_signed_in?
      redirect_to login_path
    end
  end

  private

  def user_signed_in?
    return true if session[:user_id]
  end

end
