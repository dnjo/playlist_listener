Rails.application.routes.draw do
  get '/auth/spotify/callback' => 'users#spotify'
end
