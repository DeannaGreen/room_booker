Rails.application.routes.draw do
  resources :roombookings
  root 'rooms#index'
  resources :rooms do
    get 'rooms/:id/panel'
  end
end
