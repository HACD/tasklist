
class SessionsController < ApplicationController

  skip_before_filter :check_sign_in

  def create
    auth_hash = request.env['omniauth.auth']
    if session[:user_id]
      # Means our user is signed in. Add the authorization to the user
      User.find(session[:user_id]).add_provider(auth_hash)
      render :text => "You can now login using #{auth_hash["provider"].capitalize} too!"
    else
      # Log in or sign up
      auth = Authorisation.find_or_create(auth_hash)
      # Create the session
      session[:user_id] = auth.user.id
      redirect_to tasks_path
    end
  end

  def new
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end

  def destroy
    session[:user_id] = nil
    render :text => "You've logged out!"
  end

  def anonymous
    session[:user_id] = 1
    redirect_to tasks_path
  end

end
