class RegistrationsController < Devise::RegistrationsController


  private
    # redirect a user after registering
    # def after_sign_up_path_for(resource)
    #   "/"
    # end

    # def after_inactive_sign_up_path_for(resource)
    #   "/newuser"
    # end

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :address, :description, :email, :password, :password_confirmation)
    end

    # def sign_up_params
    #   devise_parameter_sanitizer.sanitize(:sign_up)
    # end

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :address, :description, :email, :password, :password_confirmation, :current_password)
    end

    # def account_update_params
    #   devise_parameter_sanitizer.sanitize(:account_update)
    # end
end
