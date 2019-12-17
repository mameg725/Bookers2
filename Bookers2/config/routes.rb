Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "home/about" => "home#about"
  resources :home, only: [:index, :show, :about] do
  	resources :book, only: [:new, :create, :index, :show]
  end

  resources :users, only: [:show]



  root to: 'home#index'

end
