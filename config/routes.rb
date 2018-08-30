Rails.application.routes.draw do
  resources :homes
  resource :roombookings do
     get 'mybookings', to: 'roombookings#mybookings'
  end 
  resources :roombookings
  devise_for :users
  root 'homes#index'
  resources :rooms do
    member do
      get 'panel', to: 'rooms#panel'
      get 'bookings', to: 'rooms#bookings'
    end
  end 
  

  
end
