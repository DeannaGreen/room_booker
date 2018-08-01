Rails.application.routes.draw do
  resources :roombookings
  root 'rooms#index'
  resources :rooms 
  get '/rooms/:id/panel', to: 'room#panel'
  get '/rooms/:id/bookings', to: 'room#bookings'
  
  
end
