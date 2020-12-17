Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    collection do
      get 'list'
      get 'search'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
