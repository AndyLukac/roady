Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :journeys, only: [:index, :show, :new, :create, :edit, :update] do
    resources :accommodation, only: [:index, :show]
    resources :car, only: [:index, :show]
    resources :flight, only: [:index, :show]
    resources :train, only: [:index, :show]
  end
  get '/styleguide', to: 'pages#styleguide'
end
