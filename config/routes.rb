Rails.application.routes.draw do
  resources :roombookings
  root 'rooms#index'
  resources :rooms do
    member do
      get member '/rooms/:id/panel', to: 'rooms#panel'
      get '/rooms/:id/bookings', to: 'rooms#bookings'
    end
  end 
  
end
