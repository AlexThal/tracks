Rails.application.routes.draw do
  get 'friends/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # adding it separately to update the path helper so it doesn't conflit with devise
  get 'sessions/:id', to: 'exercise_sessions#show', as: 'exercise_session'

  resources :sessions, only: %i[index], controller: 'exercise_sessions' do
    resources :blocks, only: %i[index]
  end
end
