Rails.application.routes.draw do
  root 'homepages#home'
  namespace :admin do
    get 'home', to: 'homepages#index'
    get 'chat', to: 'chat#index'
    get 'search', to: 'homepages#search'
    resources :categories do 
      resources :products
    end
    resources :products, only: [:index] 
    resources :toppings, except: [:update, :edit, :show]
    resources :conversations, only: [:create] do
      member do
        post :close
      end
  
      resources :messages, only: [:create]
    end
    resources :orders, only: [:index]
  end


  resources :categories, only: [:index, :show] do 
    resources :products, only: [:index , :show]
  end

  devise_for :users
  as :user do  
    get 'login', to: 'devise/sessions#new'
    post 'signup' , to: 'devise/registrations#create'
    get 'signup', to: 'devise/registrations#new'
    get 'edit', to: 'devise/registrations#edit'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  resources :products, only:[:index]
  resources :products, only:[:show] do
    member do
     put "like" => "products#vote"
    end
    resources :comments , only:[:index, :create]
  end
  resources :toppings, only:[:index]
  resources :users, except:[:destroy, :index] do
    resources :comments, only:[:create, :destroy]
  end 
  resources :users, only:[:show] do
    resources :addresses
  end
  resources :carts, only:[:create, :index]
  resources :cart_items, only:[:create, :update, :destroy]
  resources :orders ,except:[:edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
