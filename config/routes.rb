Rails.application.routes.draw do
  
  devise_for :users
  resources :items do
    resources :carts
  end
  root to:'home#index'
    
  get "/yl", to: "home#yl", as: "yl"
  
end
