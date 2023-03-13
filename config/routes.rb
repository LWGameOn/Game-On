Rails.application.routes.draw do
  get 'reviews/new'
  get 'users/show'
  get 'user/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :events do
    get :details
    resources :plays, only: %i[create]
    resources :reviews, only: [:create]
  end
  resources :reviews, only: :destroy

  get 'calendar/:user_id', to: 'events#calendar', as: 'calendar'

  # resources :play, only: %i[destroy update]
  resources :users, only: %i[show edit update]
  post 'users/:id/report', to: 'users#report'

  resources :chatrooms, only: %i[index show] do
    resources :messages, only: :create
  end
end
