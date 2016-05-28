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
  end

  # GET /campaments/new
  def new
    @campament = Campament.new
  end

  # GET /campaments/1/edit
  def edit
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
      params.require(:campament).permit(:name, :president_id)
    end
end