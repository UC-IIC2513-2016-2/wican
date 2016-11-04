Rails.application.routes.draw do

  root to: 'home#index'

  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    resources :ongs
  end

  resources :ongs, only: [:index, :show] do
    resources :initiatives
  end

  resources :initiatives, only: [] do
    resources :initiative_signs, only: [:create] do
      get 'count', on: :collection
    end
    resource :representatives_email, only: [:new, :create]
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
