Rails.application.routes.draw do
  resources :exchange_codes, only: [:index, :create, :destroy]
  resources :daily_exchange_rates, only: [:create]
end
