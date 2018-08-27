Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :journeys, only: [:index, :show, :edit, :update]
end
