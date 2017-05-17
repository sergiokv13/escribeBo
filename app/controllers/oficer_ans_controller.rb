class OficerAnsController < ApplicationController
  before_action :set_oficer_an, only: [:show, :edit, :update, :destroy]

  # GET /oficer_ans
  # GET /oficer_ans.json
  def index
    @oficer_ans = OficerAn.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /oficer_ans/1
  # GET /oficer_ans/1.json
  def show
  end

  # GET /oficer_ans/new
  def new
    @oficer_an = OficerAn.new
  end

  # GET /oficer_ans/1/edit
  def edit
  end

  # POST /oficer_ans
  # POST /oficer_ans.json
  def create
    @oficer_an = OficerAn.new(oficer_an_params)

    respond_to do |format|
      if @oficer_an.save
        format.html { redirect_to @oficer_an, notice: 'Oficer an was successfully created.' }
        format.json { render :show, status: :created, location: @oficer_an }
      else
        format.html { render :new }
        format.json { render json: @oficer_an.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oficer_ans/1
  # PATCH/PUT /oficer_ans/1.json
  def update
    respond_to do |format|
      if @oficer_an.update(oficer_an_params)
        format.html { redirect_to @oficer_an, notice: 'Oficer an was successfully updated.' }
        format.json { render :show, status: :ok, location: @oficer_an }
      else
        format.html { render :edit }
        format.json { render json: @oficer_an.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oficer_ans/1
  # DELETE /oficer_ans/1.json
  def destroy
    @oficer_an.destroy
    respond_to do |format|
      format.html { redirect_to oficer_ans_url, notice: 'Oficer an was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oficer_an
      @oficer_an = OficerAn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def oficer_an_params
      params.require(:oficer_an).permit(:text, :title, :deadline, :document)
    end
end
