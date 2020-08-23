Rails.application.routes.draw do
  devise_for :users
    as :user do
      get "signin" => "devise/sessions#new"
      post "signin" => "devise/sessions#create"
    end
    root 'homepages#home'
    get 'home', to: 'homepages#home'
  end 