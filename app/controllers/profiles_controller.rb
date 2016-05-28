class ProfilesController < ApplicationController
  def profile
    @user = User.find(params[:id])
  end

  def asignar_grado_demolay
    @user = User.find(params[:id])
    @opciones_capitulo = Chapter.all.where(:campament_id=>@user.campament.id)
  end

  def update_asignar_grado_demolay
    @degree = Degree.new
    @degree.title = "Demolay"
    @degree.chapter = Chapter.find(params[:chapter_id])
    @degree.president_aproved = false
    @degree.deputy_aproved = false
    @degree.oficial_aproved = false
    @degree.user_id = params[:id]
    @degree.save
    redirect_to '/profile/'+params[:id]
  end

  def asignar_grado_caballero
    @user = User.find(params[:id])
    @opciones_capitulo = Chapter.all.where(:campament_id=>@user.campament.id)
  end

  def update_asignar_grado_caballero
    @degree = Degree.new
    @degree.title = "Caballero"
    @degree.chapter = Chapter.find(params[:chapter_id])
    @degree.president_aproved = false
    @degree.deputy_aproved = false
    @degree.oficial_aproved = false
    @degree.user_id = params[:id]
    @degree.save
    redirect_to '/profile/'+params[:id]
  end

  def asignar_grado_chevallier
    @user = User.find(params[:id])
    @opciones_capitulo = Chapter.all.where(:campament_id=>@user.campament.id)
  end

  def update_asignar_grado_chevallier
    @degree = Degree.new
    @degree.title = "Chevallier"
    @degree.chapter = Chapter.find(params[:chapter_id])
    @degree.president_aproved = false
    @degree.deputy_aproved = false
    @degree.oficial_aproved = false
    @degree.user_id = params[:id]
    @degree.save
    redirect_to '/profile/'+params[:id]
  end

  def asignar_consultor
    @user = User.find(params[:id])
    @opciones_capitulo = Chapter.all.where(:campament_id=>@user.campament.id)
  end

  def update_asignar_consultor
    @user = User.find(params[:id])
    @degree = Degree.new
    @degree.title = "Consultor"
    @degree.chapter = Chapter.find(params[:chapter_id])
   president_aprovede.ufalse
   deputy_aprovede.ufalse
   oficial_aprovede.ufalse
    @degree.user = @user
    @degree.save
    redirect_to "/profile/"+@user.id.to_s
  end
end
