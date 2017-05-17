class PremiacionsController < ApplicationController
  before_action :set_premiacion, only: [:show, :edit, :update, :destroy]

  # GET /premiacions
  # GET /premiacions.json
  def index
    @premiacions = Premiacion.all
  end

  # GET /premiacions/1
  # GET /premiacions/1.json
  def show
  end

  # GET /premiacions/new
  def new
    @premiacion = Premiacion.new
  end

  # GET /premiacions/1/edit
  def edit
  end

  # POST /premiacions
  # POST /premiacions.json
  def create
    @premiacion = Premiacion.new(premiacion_params)

    if @premiacion.save
      redirect_to '/premiacions'
    else
      flash[:notice] = "La premiacion no pudo ser guardada."
      redirect_to :back
    end

  end

  # PATCH/PUT /premiacions/1
  # PATCH/PUT /premiacions/1.json
  def update
    respond_to do |format|
      if @premiacion.update(premiacion_params)
        format.html { redirect_to @premiacion, notice: 'Premiacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @premiacion }
      else
        format.html { render :edit }
        format.json { render json: @premiacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /premiacions/1
  # DELETE /premiacions/1.json
  def destroy
    @premiacion.destroy
    respond_to do |format|
      format.html { redirect_to premiacions_url, notice: 'Premiacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_premiacion
      @premiacion = Premiacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def premiacion_params
      params.require(:premiacion).permit(:title, :date_of, :user_id)
    end
end
