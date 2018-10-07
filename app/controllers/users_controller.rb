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

	def edit
	end

	def update
    	respond_to do |format|
      		if @user.update(user_params)
        		format.html { redirect_to @user, notice: 'User was successfully updated.' }
        		format.json { render :show, status: :ok, location: @user }
      		else
        		format.html { render :edit }
        		format.json { render json: @user.errors, status: :unprocessable_entity }
      		end
    	end
  	end

	private

	def set_user
      @user = User.find(params[:id])
    end

	def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
