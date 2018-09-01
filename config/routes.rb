Rails.application.routes.draw do
  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
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
