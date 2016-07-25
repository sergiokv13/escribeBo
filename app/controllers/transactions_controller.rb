class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]


  # GET /transactions
  # GET /transactions.json
  def index
    if current_user.is_oficial or current_user.is_diputado
      @transactions = Transaction.all
    else
      @transactions = current_user.transactions
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @types = [['Ingreso', 'Ingreso'], ['Egreso', 'Egreso']]
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = current_user.id
    @transaction.aproved = false
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def aproveTransaction
    if current_user.charges.find_by(title: "Oficial Ejecutivo").title == "Oficial Ejecutivo"
      id = params[:id]
      transaction = Transaction.find(id)
      transaction.aprove
      redirect_to '/pendingTransactions'
    end
  end

  def pendingTransactions
    if current_user.is_oficial or current_user.is_diputado
      @transactions = Transaction.pendingTransactions
    else
      @transactions = current_user.pendingTransactions
    end
  end

  def aprovedTransactions
    if current_user.is_oficial or current_user.is_diputado
      @transactions = Transaction.aprovedTransactions.order(created_at: :desc)
    else
      @transactions = current_user.aprovedTransactions
    end
    @balance = Transaction.balance
  end

  def reports

  end

  def generateReport
    @start = params[:start].to_date
    @end = params[:end].to_date
    @transactions = Transaction.all.to_a
    @transactions = @transactions.select{|t| t.created_at >= @start and t.created_at <= @end }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:name, :description, :mount, :image, :transaction_type)
    end
end
