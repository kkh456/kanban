Rails.application.routes.draw do
  devise_for :users
  root 'top#index'

  resources :top, only: %i(index edit update)
  resources :list, only: %i(new create edit update destroy) do
    resources :card, except: %i(index) 
    resources :favorites, only: %i(create destroy)
  end
end
