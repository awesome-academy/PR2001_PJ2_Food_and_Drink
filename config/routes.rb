Rails.application.routes.draw do
  devise_for :users 
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    get "signup" => "devise/registrations#new"
    post "signup" => "devise/registrations#create"
  end
  root 'homepages#home'
  get 'home', to: 'homepages#home'
  resources :users, only: :show
  resources :password_resets, only: [:new, :create, :edit,:update]
end 
