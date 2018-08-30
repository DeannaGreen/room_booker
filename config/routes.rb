Rails.application.routes.draw do
  resources :homes
  devise_for :users
  resources :roombookings
  root 'homes#index'
  resources :rooms do
    member do
      get 'panel', to: 'rooms#panel'
      get 'bookings', to: 'rooms#bookings'
    end
  end 
  
  resources :roombookings do
    member do
      get 'mybookings', to: 'roombookings#mybookings'
    end
  end 
  
end
