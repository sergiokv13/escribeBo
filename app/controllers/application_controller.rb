require 'will_paginate/array'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_filter :enabled?

  def enabled?
    if !current_user.nil?  
      if !current_user.enabled
        sign_out current_user
        redirect_to "/users/sign_in"
      end
    end
  end

	def after_sign_in_path_for(resource)
    if current_user.sign_in_count == 1
      edit_passwords_path
    else
      '/'
    end
  end

  def not_found
    flash[:notice] = "La página solicitada no existe!"
    redirect_to ('/')
  end

  protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name,:lastname,:demolayID,:role, :email, :ci, :password, :password_confirmation, :remember_me, :chapter_id, :priory_id, :court_id) }
	  devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me, :chapter_id, :priory_id, :court_id) }
	  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name,:image,:lastname,:demolayID,:email,:ci,:password,:password_confirmation,:current_password,:birth_date,:adress,:phone,:cellphone,:father_name,:father_adress,:father_mail,:mather_name,:mather_adress,:mather_mail,:estado_civil,:nombre_esposa,:taller_nombre,:taller_numero)}
	end
end
