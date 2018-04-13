Rails.application.routes.draw do

  get 'home/index'
  get "/home/new" => "home#new"
  post "/home/new" => "home#create"
  delete "/home" => "home#destroy"
  post "/home" => "home#sort"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

end
