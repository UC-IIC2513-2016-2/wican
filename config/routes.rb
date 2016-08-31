Rails.application.routes.draw do
  namespace :admin do
    resources :ongs
  end
  resources :ongs, only: [:index, :show]
  resources :initiatives
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
