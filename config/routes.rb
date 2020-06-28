Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions'}
  root to: 'boards#index'
  resources :boards, only: [:index, :show, :new, :create] do
    resources :comments, only: :create
    namespace :api do
      resources :comments, only: :index, defaults: { format: 'json' }
    end
  end
end
