Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions'}
  root to: 'boards#index'
  resources :boards, only: [:show, :new, :create] do
    resources :comments, only: [:create]
  end

end
