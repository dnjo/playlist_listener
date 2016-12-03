require 'spotify_credentials'

class UsersController < ApplicationController
  def spotify
    credentials = request.env['omniauth.auth'].credentials
    render plain: "#{credentials.token},#{credentials.refresh_token}"
  end
end
