module MessageParser
  class << self
    def get_spotify_ids(message)
      pattern = %r{https:\/\/open\.spotify\.com\/track\/([^\s]+)}
      matches = message.scan pattern
      return [] unless matches
      matches.flatten.uniq
    end
  end
end
