Rails.application.routes.draw do
  post 'message_sender/send_message'

  get 'dashboard/index'

  devise_for :users
  resources :messages
  resources :events, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "dashboard#index"

  mount ActionCable.server => '/cable'
end
