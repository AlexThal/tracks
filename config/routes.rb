Rails.application.routes.draw do
  get 'friends/new'
  devise_for :users

  devise_scope :user do
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post 'friendships/:friend_id', to: 'friendships#create', as: 'friendships'

  resources :sessions, only: %i[index create update destroy], controller: 'exercise_sessions' do
    get 'sessions/duplicate', to: 'exercise_sessions#duplicate'
    resources :blocks, only: %i[create update destroy]
  end
  get 'sessions/new', to: 'exercise_sessions#new', as: 'exercise_session_new'
  get 'sessions/:id', to: 'exercise_sessions#show', as: 'exercise_session'

  resources :exercise_sets, only: %i[create destroy]
end
