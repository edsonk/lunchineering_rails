Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :users
  resources :destinations
  resources :destination_options
  resources :events
  resources :event_votes
end
