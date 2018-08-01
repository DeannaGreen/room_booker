Rails.application.routes.draw do
  resources :roombookings
  root 'rooms#index'
  resources :rooms do
    collection do
       get 'panel'
    end 
  end
end
