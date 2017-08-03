Rails.application.routes.draw do
  resources :costs
  resources :payees
  resources :incomes do
    get :pay, :on => :member
    get :extract, :on => :collection
  end
  resources :payers
  get "home/index"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  
  resources :sessions
  
  resources :organizations
  resources :users do
    get :profile, :on => :collection
    patch :update_self_password, :on => :member
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'home#index'
end
