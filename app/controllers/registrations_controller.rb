class RegistrationsController < Devise::RegistrationsController
  # Override the action you want here.
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :subdomain, :admin)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :subdomain, :admin)
  end

end
