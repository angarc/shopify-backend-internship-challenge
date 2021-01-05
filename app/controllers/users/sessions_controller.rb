module Users
  class SessionsController < Devise::SessionsController
  
    def after_sign_in_path_for(user)
      dashboard_path
    end

  end
end
