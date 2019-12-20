Rails.application.routes.draw do
  authenticated :user do
    root :to => "books#index", :as => "user_authenticated_root"
  end
  root 'home#index'

  get 'home/about' => "home#about"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :edit]
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy]
end
