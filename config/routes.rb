Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :journeys, only: [:index, :show, :new, :create, :edit, :update]
  get '/styleguide', to: 'pages#styleguide'
end
