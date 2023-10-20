Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end

  get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
end
