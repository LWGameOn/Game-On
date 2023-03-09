Rails.application.routes.draw do
  get 'users/show'
  get 'user/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :events do
    resources :plays, only: %i[create]
  end

  # resources :play, only: %i[destroy update]
  resources :users, only: %i[show edit]

  resources :chatrooms, only: %i[index show] do
    resources :messages, only: :create
  end
end
