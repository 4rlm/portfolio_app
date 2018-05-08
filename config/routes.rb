Rails.application.routes.draw do
  resources :thermos
  resources :algos
  root 'home#index'
end
