class LoginController < ApplicationController

  def login
    if current_user
      redirect_to "homepage"
  end

  def welcome
    @current_user = current_user
  end

  def read_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = current_user.token
      config.access_token_secret = current_user.secret
    end
    @tweets = client.user_timeline(current_user.uid)
  end
end
