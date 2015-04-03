class SessionsController < ApplicationController

  def create
    # create a user in the database
    # put that user into the session
    # find that user in the database
    if @current_user = User.find_by_uid(auth_hash["uid"])
    else
      @current_user = User.create(:name => auth_hash.info["name"], :uid => auth_hash["uid"], :token => auth_hash.credentials["token"], :secret => auth_hash.credentials["secret"] )
    end
    session[:user_id] = @current_user.id
    redirect_to "/welcome"
  end

  def auth_hash
     request.env['omniauth.auth']
  end

end
