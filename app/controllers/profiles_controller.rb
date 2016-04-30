class ProfilesController < ApplicationController
  def profile
    @user = User.find(params[:id])
  end

  def asignar_maestro_consejero
    @charge = Charge.new
    @charge.title = "Maestro Consejero"
    @charge.user_id = params[:id]
    @charge.save
    redirect_to '/profile/'+params[:id]
  end

  def asignar_comendador
    @charge = Charge.new
    @charge.title = "Ilustre Comendador Caballero"
    @charge.user_id = params[:id]
    @charge.save
    redirect_to '/profile/'+params[:id]
  end

  def asignar_chevallier
    @charge = Charge.new
    @charge.title = "Chevallier"
    @charge.user_id = params[:id]
    @charge.save
    redirect_to '/profile/'+params[:id]
  end
end
