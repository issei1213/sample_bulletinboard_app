Rails.application.routes.draw do
  devise_for :users
  root to: 'boards#index'
  resources :boards, only: [:show, :new, :create] do
    resources :comments, only: [:index]
  end

end
