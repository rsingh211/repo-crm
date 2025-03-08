Rails.application.routes.draw do
  root 'customers#index'
  get 'customers/alphabetized', to: 'customers#alphabetized'
  get 'customers/missing_email', to: 'customers#missing_email'
  resources :customers, only: [:index]
end
