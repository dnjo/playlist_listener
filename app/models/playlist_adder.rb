module PlaylistAdder
  class << self
    def add(track_ids)
      spotify_user
      track_ids.each do |track_id|
        next if track_in_playlist? track_id
        track = RSpotify::Track.find track_id
        playlist.add_tracks! [track]
      end
    end

    private

    def spotify_user
      return @spotify_user if @spotify_user
      credentials = SpotifyCredentials.build
      @spotify_user = RSpotify::User.new credentials
    end

    def playlist
      return @playlist if @playlist
      user_id = SpotifyCredentials.id
      playlist_id = PlaylistListener::Application.config.spotify_playlist_id
      @playlist = RSpotify::Playlist.find user_id, playlist_id
    end

    def track_in_playlist?(track_id)
      playlist.tracks.any? do |track|
        track.id == track_id
      end
    end
  end
end
