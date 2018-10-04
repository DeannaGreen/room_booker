class SubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != 'www'
  end
end


Rails.application.routes.draw do
  resources :companies
  resources :users, only: %i[index new create]
  resources :homes
  resources :roombookings
  
  get 'mybookings', to: 'roombookings#mybookings'
  get 'dashboard', to: 'homes#dashboard'
      
  get 'profile', to: 'users#show'
  
  devise_for :users, controllers: {registrations: 'registrations'}
  root 'homes#index'
  resources :rooms do
    member do
      get 'panel', to: 'rooms#panel'
      get 'bookings', to: 'rooms#bookings'
      get 'jsonbookings', to: 'rooms#jsonbookings'
    end
  end 

  constraints SubdomainConstraint do
    resources :projects
  end
  

  
end
