
class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    @authorisation = Authorisation.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])
    if @authorisation
      render :text => "Welcome back #{@authorisation.user.name}! You have already signed up."
    else
      user = User.new :name => auth_hash['info']['name'], :email => auth_hash['info']['email']
      user.authorisations.build :provider => auth_hash['provider'], :uid => auth_hash['uid']
      user.save
      render :text => "Hi #{user.name}! You've signed up."
    end
  end

  def new
  end

  def failure
  end
end
