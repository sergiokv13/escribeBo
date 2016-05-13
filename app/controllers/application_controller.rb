class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
    if current_user.sign_in_count == 1
      edit_passwords_path
    else
      '/'
    end
  end

  protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name,:lastname,:demolayID,:role, :email, :ci, :password, :password_confirmation, :remember_me, :chapter_id, :priory_id, :court_id) }
	  devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me, :chapter_id, :priory_id, :court_id) }
	  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name,:lastname,:demolayID, :email, :ci, :password, :password_confirmation, :current_password, :chapter_id, :priory_id, :court_id) }
	end
end
