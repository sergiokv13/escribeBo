class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.is_oficial or current_user.is_diputado
      @transactions = Transaction.all
    else
      @transactions = current_user.transactions
    end
      @transactions = @transactions.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @transaction = Transaction.new
    @types = Transaction.types
    @concepts = Transaction.concepts
    @chapters = Chapter.all.map{|k| [k.chapter_name,k.id]}
    @chapters.push(["Otro", nil])
  end

  def edit
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = current_user.id
    @transaction.aproved = false
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transacción creada correctamente' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transacción actualizada correctamente' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to '/aproved_transactions', notice: 'Transacción eliminada correctamente' }
      format.json { head :no_content }
    end
  end

  def aproveTransaction
    if current_user.is_oficial
      id = params[:id]
      transaction = Transaction.find(id)
      transaction.aprove
      flash[:notice] = "La transacción fue aprobada."
      redirect_to '/pending_transactions'
    else
      flash[:notice] = "No tienes los permisos para realizar esta operación."
      redirect_to '/'
    end
  end

  def pending_transactions
    if current_user.is_oficial or current_user.is_diputado
      @transactions = Transaction.pending_transactions
    else
      @transactions = current_user.pending_transactions
    end
    @transactions = @transactions.paginate(:page => params[:page], :per_page => 10)
  end

  def aproved_transactions
    if current_user.is_oficial or current_user.is_diputado
      @transactions = Transaction.aproved_transactions.order(created_at: :desc)
    else
      @transactions = current_user.aproved_transactions
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
