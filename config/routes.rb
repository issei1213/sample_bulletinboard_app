Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'boards#index'
  resources :boards, only: [:show, :new, :create] do
    resources :comments, only: [:index]
  end

end
