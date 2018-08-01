Rails.application.routes.draw do
  resources :roombookings
  root 'rooms#index'
  resources :rooms 
  get '/rooms/:id/panel', to: 'rooms#panel'
  get '/roombookings/:room_id/panel', to: 'roombookings#byroomid'
  
end
