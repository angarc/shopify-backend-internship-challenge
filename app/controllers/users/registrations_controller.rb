module Users
  class RegistrationsController < Devise::RegistrationsController 
    before_action :configure_permitted_parameters
    layout 'auth' 

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
    end 
  end
end
