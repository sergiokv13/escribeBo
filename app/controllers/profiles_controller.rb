class ProfilesController < ApplicationController
  def profile
    @user = User.find(params[:id])
  end

  def asignar_grado_demolay
    @degree = Degree.new
    @degree.title = "Demolay"
    @degree.user_id = params[:id]
    @degree.save
    redirect_to '/profile/'+params[:id]
  end

  def asignar_grado_caballero
    @degree = Degree.new
    @degree.title = "Caballero"
    @degree.user_id = params[:id]
    @degree.save
    redirect_to '/profile/'+params[:id]
  end

  def asignar_grado_chevallier
    @degree = Degree.new
    @degree.title = "Chevallier"
    @degree.user_id = params[:id]
    @degree.save
    redirect_to '/profile/'+params[:id]
  end
end
