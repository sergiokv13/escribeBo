class ProfilesController < ApplicationController
  def profile
    @user = User.find(params[:id])
  end

  def asignar_grado_demolay
    @user = User.find(params[:id])
    @opciones_capitulo = Chapter.all.where(:id=>@user.chapter.id)
  end

  def update_asignar_grado_demolay
    @degree = Degree.new
    @degree.title = "Demolay"
    @degree.chapter = Chapter.find(params[:chapter_id])
    @degree.user_id = params[:id]
    @degree.save
    redirect_to '/profile/'+params[:id]
  end

  def asignar_grado_caballero
    @user = User.find(params[:id])
    @opciones_capitulo = Chapter.all.where(:chapter_type=>"Priorato")
  end

  def update_asignar_grado_caballero
    @degree = Degree.new
    @degree.title = "Caballero"
    @chapter = Chapter.find(params[:chapter_id])
    @degree.chapter = @chapter
    @chapter.knights.push(User.find(params[:id]))
    @degree.user_id = params[:id]
    @chapter.save
    @degree.save
    redirect_to '/profile/'+params[:id]
  end

  def asignar_grado_chevallier
    @user = User.find(params[:id])
   @opciones_capitulo = Chapter.all.where(:chapter_type=>"Corte")
  end

  def update_asignar_grado_chevallier
    @degree = Degree.new
    @degree.title = "Chevallier"
    @chapter = Chapter.find(params[:chapter_id])
    @degree.chapter = @chapter
    @chapter.chevalliers.push(User.find(params[:id]))    
    @degree.user_id = params[:id]
    @chapter.save
    @degree.save
    redirect_to '/profile/'+params[:id]
  end

  def asignar_consultor
    @user = User.find(params[:id])
    @opciones_capitulo = Chapter.all.where(:campament_id=>@user.campament.id)
  end

  def update_asignar_consultor
    @user = User.find(params[:id])
    @chapter =  Chapter.find(params[:chapter_id])
    @degree = Degree.new
    @degree.title = "Consultor"
    @degree.chapter = @chapter
    @chapter.consultants.push(@user)
    @chapter.save
    @degree.user = @user
    @degree.save
    redirect_to "/profile/"+@user.id.to_s
  end
end
