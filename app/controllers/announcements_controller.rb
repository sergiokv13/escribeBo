class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]

  # GET /announcements
  # GET /announcements.json
  def index
    @publicaciones_para_mostrar = Array.new
    publicaciones = Announcement.aproved.reverse
    if current_user.is_oficial
      @publicaciones_para_mostrar = publicaciones
    else
      publicaciones.each do |publicacion|
        if publicacion.aprobada(current_user)
          @publicaciones_para_mostrar.push(publicacion)
        end
      end
    end
    @publicaciones_para_mostrar = @publicaciones_para_mostrar.paginate(page: params[:page], per_page: 1)

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
  end

  # GET /announcements/new
  def new
    @announcement = Announcement.new
  end

  # GET /announcements/1/edit
  def edit
  end

  # POST /announcements
  # POST /announcements.json
  def create
    @announcement = Announcement.new(announcement_params)
    @degrees = params[:degrees]['degree']
    @charges = params[:charges]['charge']
    @announcement.degrees = @degrees.join(',')
    @annoCuncement.charges = @charges.join(',')
    @announcement.user = current_user
    @announcement.president_aproved = false
    @announcement.oficial_aproved = false
    respond_to do |format|
      if @announcement.save
        format.html { redirect_to @announcement, notice: 'El anuncio se creo correctamente.' }
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcements/1
  # PATCH/PUT /announcements/1.json
  def update
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to @announcement, notice: 'El anuncio se edito correctamente.' }
        format.json { render :show, status: :ok, location: @announcement }
      else
        format.html { render :edit }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def createFromChapter
    @announcement = Announcement.new()
    @announcement.user = current_user
    @announcement.chapter = Chapter.find(params[:id])
    @announcement.campament = Chapter.find(params[:id]).campament
    @announcement.subject = params[:subject]
    @announcement.content = params[:content]
    @announcement.image = params[:image]
    @degrees = Array.new
    @charges = Array.new
    if params[:degrees] != nil
      @degrees = params[:degrees]['degree']
    end
    if params[:charges]!= nil
      @charges = params[:charges]['charge']
    end
    @charges.push("Diputado")
    @announcement.degrees = @degrees.join(',')
    @announcement.charges = @charges.join(',')
    if @announcement.save
      redirect_to '/chapters/'+ params[:id]
    else
      flash[:notice] = "El formato de la imagen es incorrecto."
      redirect_to '/chapters/'+ params[:id]
    end
  end

  def  createFromCampament
    @announcement = Announcement.new()
    @announcement.user = current_user
    @announcement.campament = Campament.find(params[:id])
    @announcement.subject = params[:subject]
    @announcement.content = params[:content]
    @announcement.image = params[:image]
    @degrees = Array.new
    @charges = Array.new
    if params[:degrees] != nil
      @degrees = params[:degrees]['degree']
    end
    if params[:charges] != nil
      @charges = params[:charges]['charge']
    end
    @charges.push("Diputado")
    @announcement.degrees = @degrees.join(',')
    @announcement.charges = @charges.join(',')
    if @announcement.save
      redirect_to '/chapters/'+ params[:id]
    else
      flash[:notice] = "El formato de la imagen es incorrecto."
      redirect_to '/chapters/'+ params[:id]
    end
  end
  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    @announcement.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'El anuncio se borro correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announcement_params
      params.require(:announcement).permit(:subject, :content, :user_id, :image,:degrees,:charges)
    end
end
