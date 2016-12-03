module Api::V1
  class SlackController < ApplicationController
    before_action :authenticate

    def create
      message = strip_illegal_characters params[:text]
      spotify_ids = MessageParser.get_spotify_ids message
      PlaylistAdder.add spotify_ids
      head 201
    rescue => e
      @retry_count ||= 0
      @retry_count += 1
      retry if @retry_count < 5
      Rails.logger.error e
      Rails.logger.error e.backtrace.join "\n"
      head 500
    end

    private

    def authenticate
      token = PlaylistListener::Application.config.slack_token
      head :forbidden unless token == params[:token]
    end

    def strip_illegal_characters(message)
      message.tr '<>', ''
    end
  end
end
