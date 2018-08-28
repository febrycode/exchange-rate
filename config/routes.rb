Rails.application.routes.draw do
  resources :exchange_codes, only: [:index]
end
