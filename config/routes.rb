Rails.application.routes.draw do

  root to: 'home#index'

  namespace :admin do
    resources :ongs
  end

  resources :ongs, only: [:index, :show] do
    resources :initiatives
  end

  resources :initiatives, only: [] do
    resources :initiative_signs, only: [:create]
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
