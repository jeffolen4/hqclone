Rails.application.routes.draw do

  resources :users, only: [:new, :create, :index, :show]
  resources :sessions, only: [:new, :create, :destroy]

  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # resources :users
  resources :questions
  #get 'games/:id' => 'games#show'
  root 'games#index'

  get "games/join", to: "games#join", as: :game_join
  post "games/waiting_room", to: "games#waiting_room", as: :waiting_room

  resources :games

  resources :players

end
