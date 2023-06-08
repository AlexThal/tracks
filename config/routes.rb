Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # adding it separately to update the path helper so it doesn't conflit with devise
  get 'sessions/:id', to: 'exercise_sessions#show', as: 'exercise_session'

  resources :sessions, only: %i[index create new], controller: 'exercise_sessions' do
    resources :blocks, only: %i[create edit destroy]
  end

  resources :exercise_sets, only: %i[create destroy]

end
