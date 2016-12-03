require 'rspotify'
require 'rspotify/oauth'

client_id = ENV['SPOTIFY_CLIENT_ID']
secret = ENV['SPOTIFY_SECRET']

RSpotify.authenticate client_id, secret

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, client_id, secret, scope: 'playlist-modify-public'
end
