class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 before_action :configure_permitted_paramters, if: :devise_controller?

 protected
  def configure_permitted_paramters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name

  end
   protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
end
