Rails.application.routes.draw do
  devise_for :users, {
    controllers: {
      "registrations": "users/registrations",
      "sessions": "users/sessions",
    }
  }

  root 'pages#index'

  get '/get_suggestions', to: 'pages#get_suggestions', as: :get_suggestions

  get '/results', to: 'pages#search_results', as: :search_results

  resources :users, only: [:show]
  resources :photos, only: [:show]

  scope :dashboard do
    get '/', to: 'dashboard#index', as: :dashboard
  end
  namespace :dashboard do
    resources :photos
  end
end
