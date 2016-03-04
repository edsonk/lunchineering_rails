Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :users
  resources :destinations
  resources :destination_options
  resources :events
  resources :event_votes
end
