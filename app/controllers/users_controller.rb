class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params.merge(admin: false,subdomain:current_user.subdomain))
		redirect_to users_path
	end

	private
	def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
