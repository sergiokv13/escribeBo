require 'will_paginate/array'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

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
	  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name,:image,:lastname,:demolayID,:email,:ci,:password,:password_confirmation,:current_password,:birth_dateimiento,:adress,:phone,:cellphone,:father_name,:father_adress,:father_mail,:mather_name,:mather_adress,:mather_mail,:estado_civil,:nombre_esposa,:taller_nombre,:taller_numero)}
	end
end




            
  