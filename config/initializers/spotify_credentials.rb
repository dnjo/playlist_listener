require 'spotify_credentials'

SpotifyCredentials.id = ENV['SPOTIFY_ID']
SpotifyCredentials.token = ENV['SPOTIFY_TOKEN']
SpotifyCredentials.refresh_token = ENV['SPOTIFY_REFRESH_TOKEN']
