class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  def follow_chapter
    user = User.find(params[:user_id])
    chapter = Chapter.find(params[:chapter_id])
    follow = ChapterUserFollow.new
    follow.user_id = user.id
    follow.chapter_id = chapter.id
    follow.number_views = chapter.announcements.count
    follow.save
    redirect_to '/chapters/' + chapter.id.to_s
  end

  def unfollow_chapter
    user = User.find(params[:user_id])
    chapter = Chapter.find(params[:chapter_id])
    follow = user.chapter_user_follows.find_by(chapter_id: chapter.id)
    follow.destroy
    redirect_to '/chapters/' + chapter.id.to_s
  end

  # GET /chapters
  # GET /chapters.json
  def index
    @chapters = Chapter.all
    @capitulos = Chapter.where(:chapter_type => "Capítulo").sort_by {|obj| obj.number}
    @prioratos = Chapter.where(:chapter_type => "Priorato").sort_by {|obj| obj.number}
    @cortes = Chapter.where(:chapter_type => "Corte").sort_by {|obj| obj.number}
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
    if @chapter.chapter_type == "Capítulo"
      @active_demolays = @chapter.demolays.select{|d| d.getAge < 21}.count
    end

    if @chapter.chapter_type == "Priorato"
      @active_demolays = @chapter.knights.select{|d| d.getAge < 21}.count
    end

        if @chapter.chapter_type == "Corte"
      @active_demolays = @chapter.chevaliers.select{|d| d.getAge < 21}.count
    end

    if current_user.chapter_user_follows.count != 0
      follow = current_user.chapter_user_follows.find_by(chapter_id: @chapter.id)
      if !follow.nil?
        follow.number_views = @chapter.announcements.count
        follow.save
      end
    end
    @publicaciones_para_mostrar = Array.new
    publicaciones = @chapter.aproved_announcements.reverse
    if current_user.is_oficial
      @publicaciones_para_mostrar = publicaciones.paginate(page: params[:page], per_page: 1)
    else
      publicaciones.each do |publicacion|
        if publicacion.aprobada(current_user)
          @publicaciones_para_mostrar.push(publicacion)
        end
      end
      @publicaciones_para_mostrar = @publicaciones_para_mostrar.paginate(page: params[:page], per_page: 10)
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  # GET /chapters/new
  def new
    if current_user.is_oficial
      @chapter = Chapter.new
      @campaments = Campament.all
    else
      redirect_to '/'
    end

  end

  # GET /chapters/1/edit
  def edit
    if current_user.is_oficial
      @campaments = Campament.all
    else
      redirect_to '/'
    end
  end

  def gestion
    @chapter = Chapter.find(params[:id])
    @posibles_encargados =  Array.new
      @chapter.chapter_users.each do |demolay|
        if @chapter.chapter_type == "Capítulo"
          if demolay.tiene_el_grado("DeMolay")
            @posibles_encargados.push(demolay)
          end
        else
           @posibles_encargados.push(demolay)
        end
      end
    @posibles_presidente =  @chapter.consultants
  end


  def update_gestion
    @chapter = Chapter.find(params[:id])
    puts "=================================================="
    puts @chapter.id
    if params[:id_encargado] != ""
      @encargado = User.find(params[:id_encargado])
      puts "=================================================="
      puts @encargado.id
      @chapter.chapter_president = @encargado
      @charge = Charge.new
      @charge.user = @encargado

      if @chapter.chapter_type == "Capítulo"
        @charge.title = "Maestre Consejero"
        @charge.ente = "Capítulo"
      end
      if @chapter.chapter_type == "Priorato"
        @charge.title = "Ilustre Comendador Caballero"
        @charge.ente = "Priorato"
      end
      if @chapter.chapter_type == "Corte"
        @charge.title = "Gran Comendador Chevalier"
        @charge.ente = "Corte"
      end


      @charge.chapter = @chapter
      @charge.save

    end
    @conPresident = User.find(params[:presidente_consejo_consultivo])
    @chapter.chapter_consultant_president = @conPresident
    @chapter.save
    @charge = Charge.new
    @charge.user = @conPresident
    @charge.title = "Presidente Consejo Consultivo"
    @charge.chapter = @chapter
    @charge.save

    redirect_to "/chapters/"+@chapter.id.to_s
  end

  # POST /chapters
  # POST /chapters.json
  def create
     @campaments = Campament.all
    if current_user.is_oficial
      @chapter = Chapter.new(chapter_params)

      respond_to do |format|
        if @chapter.save
          format.html { redirect_to @chapter, notice: 'Exitosamente creado' }
          format.json { render :show, status: :created, location: @chapter }
        else
          format.html { render :new }
          format.json { render json: @chapter.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    if current_user.is_oficial
      respond_to do |format|
        if @chapter.update(chapter_params)
          format.html { redirect_to @chapter, notice: 'Exitosamente actualizado' }
          format.json { render :show, status: :ok, location: @chapter }
        else
          format.html { render :edit }
          format.json { render json: @chapter.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    if current_user.is_oficial
      @chapter.sleep = true
      
      @chapter.save
      redirect_to :back
    end
  end

  def real_destroy
    if @current_user.is_oficial
      @chapter = Chapter.find(params[:id])
      @chapter.destroy
      respond_to do |format|
        format.html { redirect_to campaments_url, notice: 'El ente fue eliminado.' }
        format.json { head :no_content }
      end
    else
      redirect_to :back
    end
  end

  def wake
    if current_user.is_oficial
      @chapter = Chapter.find(params[:id])
      @chapter.sleep = false
      @chapter.save
      redirect_to :back
    end
  end

  def chapter_users
    @chapter = Chapter.find(params[:id])
    @user_type = params[:type].to_s
    @user_type = @user_type.to_i
    if @user_type == 1
      @users = @chapter.chapter_users
    else
      @users = @chapter.consultants
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:chapter_name, :number, :chapter_type,:campament_id,:image, :sleep, :aniversary)
    end
end
