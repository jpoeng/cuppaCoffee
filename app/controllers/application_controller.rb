class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :authenticate_user!

  private

    # control the redirects after a successful login
    def after_sign_in_path_for(resource)
      # current_user
      # root_path
      home_path
    end
end
