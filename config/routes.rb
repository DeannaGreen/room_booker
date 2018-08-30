Rails.application.routes.draw do
  resources :homes
  devise_for :users
  resources :roombookings
  root 'home#index'
  resources :rooms do
    member do
      get 'panel', to: 'rooms#panel'
      get 'bookings', to: 'rooms#bookings'
    end
  end 
  
end
