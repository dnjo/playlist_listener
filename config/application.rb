require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PlaylistListener
  class Application < Rails::Application
    config.slack_token = ENV['SLACK_TOKEN']
    config.spotify_playlist_id = ENV['SPOTIFY_PLAYLIST_ID']
  end
end
