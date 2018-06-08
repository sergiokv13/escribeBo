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
      @transactions = @transactions.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @types = [['Ingreso', 'Ingreso'], ['Egreso', 'Egreso']]
    @concepts = [['Iniciación','Iniciación'],['Elevación','Elevación'],['Investidura','Investidura'],['Investidura Chevalier','Investidura Chevalier'],['DeMolay Card','DeMolay Card'],['Consultor','Consultor'],['Premiación','Premiación'],['Otro','Otro']]
    @chapters = Chapter.all.map{|k| [k.chapter_name,k.id]}
    @chapters.push(["Otro", nil])
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
        format.html { redirect_to @transaction, notice: 'Transacción creada correctamente' }
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
        format.html { redirect_to @transaction, notice: 'Transacción actualizada correctamente' }
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
      format.html { redirect_to '/aprovedTransactions', notice: 'Transacción borrada correctamente' }
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
    @transactions = @transactions.paginate(:page => params[:page], :per_page => 10)
  end

  def aprovedTransactions
    if current_user.is_oficial or current_user.is_diputado
      @transactions = Transaction.aprovedTransactions.order(created_at: :desc)
    else
      @transactions = current_user.aprovedTransactions
    end
    @balance = Transaction.balance
    @transactions = @transactions.paginate(:page => params[:page], :per_page => 10)
  end

  def reports

  end

  def generateReport
    @start = params[:start].to_date
    @end = params[:end].to_date
    possible_transactions = Transaction.all
    @transactions = Array.new
    @total = 0
    possible_transactions.each do |t|
      if t.created_at.to_date >= @start and t.created_at.to_date <= @end
        @transactions.push(t)
        if t.transaction_type == "Ingreso"
          @total += (t.float_amount || t.mount)
        else
          @total -= (t.float_amount || t.mount)
        end
      end
    end
    @transactions
  end

  def mis_transacciones
    @transactions = current_user.transactions.paginate(:page => params[:page], :per_page => 10)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:chapter_id,:float_amount,:plantilla,:name, :description, :mount, :image, :transaction_type,:concept_type, :receipt_number)
    end
end
