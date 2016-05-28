class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  # GET /chapters
  # GET /chapters.json
  def index
    @chapters = Chapter.all
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
    @campaments = Campament.all
  end

  # GET /chapters/1/edit
  def edit
    @campaments = Campament.all
  end

  def gestion
    @chapter = Chapter.find(params[:id])
    @posibles_encargados =  Array.new
    User.where(:role=>"Demolay").all.each do |user|
      arr = Array.new
      arr.push(user.fullName)
      arr.push(user.id)
      @posibles_encargados.push(arr)
    end  
  end


  def update_gestion
    @chapter = Chapter.find(params[:id])
    @user = User.find(params[:id_encargado])
    @chapter.chapter_president = @user
    @chapter.save
    @charge = Charge.new
    @charge.user = @user
    if @chapter.chapter_type == "Capitulo"
      @charge.title = "Maestro Consejero"
    end
    if @chapter.chapter_type == "Priorato"
      @charge.title = "Ilustre Comendador Caballero"
    end
    if @chapter.chapter_type == "Corte"
      @charge.title = "Gran Comendador Chevalier"
    end
    @charge.save

    redirect_to "/chapters/"+@chapter.id.to_s
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = Chapter.new(chapter_params)

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to @chapter, notice: 'Chapter was successfully created.' }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to @chapter, notice: 'Chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to chapters_url, notice: 'Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:chapter_name, :chapter_type,:campament_id)
    end
end
