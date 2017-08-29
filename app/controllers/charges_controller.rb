class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :edit, :update, :destroy]

  def search_name
    name = params[:name].to_s
    puts "======================================================"
    if name == ""
      @users = []
    else
      @users = User.where("name LIKE ? or lastname LIKE ? or full_name LIKE ? ","%#{name}%", "%#{name}%", "%#{name}%")
    end
    render :partial => "names", :object => @users
  end

  # GET /charges
  # GET /charges.json
  def index
    @charges = Charge.all
  end

  # GET /charges/1
  # GET /charges/1.json
  def show
  end

  # GET /charges/new
  def new
    @charge = Charge.new
  end

  # GET /charges/1/edit
  def edit
  end

  def drop_gestion
    @users = []
    @posibles_oficiales =  User.where(:role=>"Trabajador adulto")
  end

  def update_drop_gestion


    if params[:capitulo_check_box] == nil && params[:priorato_check_box] == nil && params[:corte_check_box] == nil 
        flash[:notice] = "Por lo menos una de las gestiones tiene que ser reiniciada."
        redirect_to :back
    else

      if params[:id_oficial] != "" 
        if params[:capitulo_check_box] != nil
          Charge.drop_capitulo(params[:gestion])
        end

        if params[:priorato_check_box] != nil
          Charge.drop_priorato(params[:gestion])
        end

        if params[:corte_check_box] != nil
          Charge.drop_corte(params[:gestion])
        end

        if params[:corte_check_box] != nil
          Charge.drop_departamento(params[:gestion])
        end

        if params[:corte_check_box] != nil
          Charge.drop_gabinete(params[:gestion])
        end

        cargo_oficial = Charge.new
        cargo_oficial.ente = "Gabinete"
        cargo_oficial.title = "Oficial Ejecutivo"
        cargo_oficial.user_id = params[:id_oficial]
        cargo_oficial.campament_id = 1
        cargo_oficial.save


        flash[:notice] = "La gestion fue reiniciada."
        redirect_to "/"
      else
        flash[:notice] = "No se pudo reiniciar la gestión porque el usuario no existe."
        redirect_to :back
      end
    end
  end

  # POST /charges
  # POST /charges.json
  def create
    @charge = Charge.new(charge_params)

    respond_to do |format|
      if @charge.save
        format.html { redirect_to @charge, notice: 'Charge was successfully created.' }
        format.json { render :show, status: :created, location: @charge }
      else
        format.html { render :new }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charges/1
  # PATCH/PUT /charges/1.json
  def update
    respond_to do |format|
      if @charge.update(charge_params)
        format.html { redirect_to @charge, notice: 'Charge was successfully updated.' }
        format.json { render :show, status: :ok, location: @charge }
      else
        format.html { render :edit }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charges/1
  # DELETE /charges/1.json
  def destroy
    @charge.destroy
    respond_to do |format|
      format.html { redirect_to charges_url, notice: 'Charge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge
      @charge = Charge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_params
      params.require(:charge).permit(:title, :user_id)
    end
end
