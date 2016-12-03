module MessageParser
  class << self
    def get_spotify_ids(message)
      message = strip_illegal_characters message
      pattern = %r{https:\/\/open\.spotify\.com\/track\/([^\s]+)}
      matches = message.scan pattern
      return [] unless matches
      matches.flatten.uniq
    end

    private

    def strip_illegal_characters(message)
      message.tr '<>', ''
    end
  end
end
