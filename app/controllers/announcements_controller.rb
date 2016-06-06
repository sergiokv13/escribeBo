class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]

  # GET /announcements
  # GET /announcements.json
  def index
    @publicaciones_para_mostrar = Array.new
    publicaciones = Announcement.all.order(created_at: :desc)
    if current_user.is_oficial
      @publicaciones_para_mostrar = publicaciones
    else
      publicaciones.each do |publicacion|
        if publicacion.aprobada(current_user)
          @publicaciones_para_mostrar.push(publicacion)
        end
      end
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
    respond_to do |format|
      if @announcement.save
        format.html { redirect_to @announcement, notice: 'Announcement was successfully created.' }
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
        format.html { redirect_to @announcement, notice: 'Announcement was successfully updated.' }
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
    @degrees = params[:degrees]['degree']
    @charges = params[:charges]['charge']
    @charges.push("Diputado")
    @announcement.degrees = @degrees.join(',')
    @announcement.charges = @charges.join(',')
    @announcement.save
    redirect_to '/chapters/'+ params[:id]
  end

  def  createFromCampament
    @announcement = Announcement.new()
    @announcement.user = current_user
    @announcement.campament = Campament.find(params[:id])
    @announcement.subject = params[:subject]
    @announcement.content = params[:content]
    @announcement.image = params[:image]
    @degrees = params[:degrees]['degree']
    @charges = params[:charges]['charge']
    @charges.push("Diputado")
    @announcement.degrees = @degrees.join(',')
    @announcement.charges = @charges.join(',')
    @announcement.save
    redirect_to '/campaments/'+ params[:id]
  end
  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    @announcement.destroy
    respond_to do |format|
      format.html { redirect_to announcements_url, notice: 'Announcement was successfully destroyed.' }
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
