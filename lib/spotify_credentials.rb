class SpotifyCredentials
  class << self
    attr_accessor :id,
                  :token,
                  :refresh_token

    def build
      credentials = OpenStruct.new
      credentials.refresh_token = @refresh_token
      credentials.token = @token
      {
        'id' => @id,
        'credentials' => credentials
      }
    end
  end
end
