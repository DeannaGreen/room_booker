class ApplicationController < ActionController::Base
	  before_action :authenticate_user!
	  after_action :store_action
	  
	  def store_action
	    return unless request.get? 
	    if (request.path != "/users/sign_in" &&
	        request.path != "/users/sign_up" &&
	        request.path != "/users/password/new" &&
	        request.path != "/users/password/edit" &&
	        request.path != "/users/confirmation" &&
	        request.path != "/users/sign_out" &&
	        !request.xhr?) # don't store ajax calls
	      store_location_for(:user, homes_path())
	    end
	  end

	  def after_sign_in_path_for(resource)
	  	# sign_in(:user, @account.user)	  	
	  	root_url( domain: 'happymuffin.co.uk/dashboard' , subdomain: current_user.subdomain)
	  end
end
