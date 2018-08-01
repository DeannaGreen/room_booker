Rails.application.routes.draw do
  resources :roombookings
  root 'rooms#index'
  resources :rooms do
    member do
      get '/:id/panel', to: 'rooms#panel'
      get '/:id/bookings', to: 'rooms#bookings'
    end
  end 
  
end
