Rails.application.routes.draw do
  get 'friends/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'friendships/:friend_id', to: 'friendships#create', as: 'friendships'

  resources :sessions, only: %i[index create new], controller: 'exercise_sessions' do
    resources :blocks, only: %i[create edit destroy]
  end

  get 'sessions/:id', to: 'exercise_sessions#show', as: 'exercise_session'

  resources :exercise_sets, only: %i[create destroy]
end
