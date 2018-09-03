Rails.application.routes.draw do
  resources :companies
  resources :homes 
  resources :roombookings
  
  get 'mybookings', to: 'roombookings#mybookings'
      
  get 'profile', to: 'users#show'
  
  devise_for :users
  root 'homes#index'
  resources :rooms do
    member do
      get 'panel', to: 'rooms#panel'
      get 'bookings', to: 'rooms#bookings'
      get 'jsonbookings', to: 'rooms#jsonbookings'
    end
  end 
  

  
end
