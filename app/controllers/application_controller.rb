class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource) 
      root_path
    end

    def after_sign_out_path_for(resource)
      user_session_path
    end

    # def current_user
    #   ActiveDecorator::Decorator.instance.decorate(super) if super.present?
    #   super
    # end

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [ :email, :encrypted_password, :name])
    end
end
