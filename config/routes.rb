Rails.application.routes.draw do
  get '/auth/spotify/callback' => 'users#spotify'

  namespace :api do
    namespace :v1 do
      post 'slack' => 'slack#create'
    end
  end
end
