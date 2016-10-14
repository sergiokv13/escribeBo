class CampamentsController < ApplicationController
  before_action :set_campament, only: [:show, :edit, :update, :destroy]

  # GET /campaments
  # GET /campaments.json
  def index
    @campaments = Campament.all
  end

  # GET /campaments/1
  # GET /campaments/1.json
  def show
    @publicaciones_para_mostrar = Array.new
    publicaciones = @campament.announcements
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

  # GET /campaments/new
  def new
    @campament = Campament.new
  end

  # GET /campaments/1/edit
  def edit
  end



  def gestion
    @campament = Campament.find(params[:id])
    @posibles_delegados =  User.where(:role=>"No Demolay").where(:campament_id => @campament.id).all
    @posibles_maestros =  Array.new
    User.where(role: "Demolay").where(campament_id: @campament.id).each do |u|
      if u.is_degree_demolay
        @posibles_maestros.push(u)
      end
    end
  end


  def update_gestion
    @campament = Campament.find(params[:id])
    if params[:id_maestro] != ""
      @encargado = User.find(params[:id_maestro])
      @campament.maestro_consejero = @encargado
      @charge = Charge.new
      @charge.user = @encargado
      @charge.title = "Maestro Consejero"
      @charge.campament = @campament
      @charge.save
    end

    @conPresident = User.find(params[:id_delegado])

    @campament.president = @conPresident
    @campament.save
    @charge = Charge.new
    @charge.user = @conPresident
    @charge.title = "Delegado Regional"
    @charge.campament = @campament
    @charge.save
    redirect_to "/campaments/"+@campament.id.to_s
  end


  # POST /campaments
  # POST /campaments.json
  def create
    @campament = Campament.new(campament_params)

    respond_to do |format|
      if @campament.save
        format.html { redirect_to @campament, notice: 'Campament was successfully created.' }
        format.json { render :show, status: :created, location: @campament }
      else
        format.html { render :new }
        format.json { render json: @campament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaments/1
  # PATCH/PUT /campaments/1.json
  def update
    respond_to do |format|
      if @campament.update(campament_params)
        format.html { redirect_to @campament, notice: 'Campament was successfully updated.' }
        format.json { render :show, status: :ok, location: @campament }
      else
        format.html { render :edit }
        format.json { render json: @campament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaments/1
  # DELETE /campaments/1.json
  def destroy
    @campament.destroy
    respond_to do |format|
      format.html { redirect_to campaments_url, notice: 'Campament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campament
      @campament = Campament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campament_params
      params.require(:campament).permit(:name, :image)
    end
end
