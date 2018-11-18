class ProfilesController < ApplicationController

  def update_chapters
    @chapters = Chapter.where(:campament_id => params[:campament], :chapter_type =>"Capítulo")
    render :partial => "chapters", :object => @chapters
  end
  
  def profile
    @premiacion = UserPremiation.new
    @user = User.find(params[:id])
    @chapters = Chapter.where(:chapter_type =>"Capítulo").all
  end

  def asignar_grado_demolay
    @user = User.find(params[:id])
    @opciones_capitulo = Chapter.all.where(:id=>@user.chapter.id)
  end

  def update_asignar_grado_demolay
    @degree = Degree.new
    @degree.title = "DeMolay"
    @degree.image = params[:image]
    @degree.date = Date.parse(params[:date_of].first.last)
    @degree.chapter = Chapter.find(params[:chapter_id])
    @degree.president_aproved = false
    @degree.deputy_aproved = false
    @degree.oficial_aproved = false
    @degree.user_id = params[:id]
    if !@degree.save
      flash[:notice] = "Los datos estan incorrectos. Recuerda que solo puedes subir Zip."
    end
    redirect_to '/profile/'+params[:id]
  end

  def asignar_grado_caballero
    @user = User.find(params[:id])
    @opciones_capitulo = Chapter.all.where(:chapter_type=>"Priorato")
  end

  def update_asignar_grado_caballero
    @degree = Degree.new
    @degree.title = "Caballero"
    @degree.image = params[:image]
    @degree.date = Date.parse(params[:date_of].first.last)
    @chapter = Chapter.find(params[:chapter_id])
    @degree.chapter = @chapter
    @degree.president_aproved = false
    @degree.deputy_aproved = false
    @degree.oficial_aproved = false
    @chapter.knights.push(User.find(params[:id]))
    @degree.user_id = params[:id]
    @chapter.save
    if !@degree.save
      flash[:notice] = "Los datos estan incorrectos. Recuerda que solo puedes subir Zip."
    end
    redirect_to '/profile/'+params[:id]
  end

  def asignar_grado_chevalier
    @user = User.find(params[:id])
   @opciones_capitulo = Chapter.all.where(:chapter_type=>"Corte")
  end

  def update_asignar_grado_chevalier
    @degree = Degree.new
    @degree.title = "Chevalier"
    @degree.image = params[:image]
    @degree.date = Date.parse(params[:date_of].first.last)
    @chapter = Chapter.find(params[:chapter_id])
    @degree.president_aproved = false
    @degree.deputy_aproved = false
    @degree.oficial_aproved = false
    @degree.chapter = @chapter
    @chapter.chevaliers.push(User.find(params[:id]))
    @degree.user_id = params[:id]
    @chapter.save
    if !@degree.save
      flash[:notice] = "Los datos estan incorrectos. Recuerda que solo puedes subir Zip."
    end
    redirect_to '/profile/'+params[:id]
  end

  def asignar_senior_demolay
    @user = User.find(params[:id])
    @opciones_capitulo = Chapter.all.where(:id=>@user.chapter.id)
  end

  def update_asignar_senior_demolay
    @degree = Degree.new
    @degree.title = "Senior DeMolay"
    @degree.image = params[:image]
    @degree.date = Date.parse(params[:date_of].first.last)
    @chapter = Chapter.find(params[:chapter_id])
    @degree.president_aproved = false
    @degree.deputy_aproved = false
    @degree.oficial_aproved = false
    @degree.chapter = @chapter
    @chapter.chevaliers.push(User.find(params[:id]))
    @degree.user_id = params[:id]
    @chapter.save
    if !@degree.save
      flash[:notice] = "Los datos estan incorrectos. Recuerda que solo puedes subir Zip."
    end
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
    @degree.date = Date.parse(params[:date_of].first.last)
    @degree.image = params[:image]
    @degree.president_aproved = false
    @degree.deputy_aproved = false
    @degree.oficial_aproved = false
    @degree.chapter = @chapter
    @chapter.consultants.push(@user)
    @chapter.save
    @degree.user = @user
    if !@degree.save
      flash[:notice] = "Los datos estan incorrectos. Recuerda que solo puedes subir Zip."
    end
    redirect_to "/profile/"+@user.id.to_s
  end

  def transfer_user

  end

  def add_premiacion
    premiacion = params[:premiacion_id]
    date_of_premiacion = params[:date_of]
    user_id = (params[:user_id])
    user_premiation = UserPremiation.new
    user_premiation.user_id = user_id
    user_premiation.premiacion_id = premiacion
    user_premiation.date_of = date_of_premiacion
    user_premiation.save
    redirect_to '/profile/' + user_id.to_s
  end
end
