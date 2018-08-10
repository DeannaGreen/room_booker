Rails.application.routes.draw do
  devise_for :users
  resources :roombookings
  root 'rooms#index'
  resources :rooms do
    member do
      get 'panel', to: 'rooms#panel'
      get 'bookings', to: 'rooms#bookings'
    end
  end 
  
end
