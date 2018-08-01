Rails.application.routes.draw do
  resources :roombookings
  root 'rooms#index'
  resources :rooms 
  get '/rooms/:id/panel', to: 'rooms#panel'
  get '/rooms/:id/bookings', to: 'rooms#bookings'
  
  
end
