class InboxesController < ApplicationController
  before_action :set_inbox, only: [:show, :edit, :update, :destroy]

  # GET /inboxes
  # GET /inboxes.json
  def index
    @inboxes = current_user.visible_inboxes.order(created_at: :desc)
    @enviados = current_user.visible_sent.order(created_at: :desc)
    @inboxes = @inboxes.paginate(:page => params[:page], :per_page => 5)
    @enviados = @enviados.paginate(:page => params[:page], :per_page => 5)
  end

  # GET /inboxes/1
  # GET /inboxes/1.json
  def show
    if @inbox.user2.id == current_user.id
      @inbox.seen = true
      @inbox.save
    end
  end

  # GET /inboxes/new
  def new
    @inbox = Inbox.new
    if params[:user_id]!=nil
      @user_id = params[:user_id]
      @user = User.where(:id => @user_id).first
    else
      @user_id=0
    end
  end

  def update_user_field
    user_f = params[:user_field]
    if user_f.size < 2
      @users = User.where(:id => user_f)
      render :partial => "partial", :object => @users
    else
      @users = User.where("name || ' ' || lastname LIKE ?" , "%#{user_f}%")
      render :partial => "partial", :object => @users
    end
  end

  # GET /inboxes/1/edit
  def edit
  end

  # POST /inboxes
  # POST /inboxes.json
  def create
    @inbox = Inbox.new(inbox_params)
    @inbox.user1 = current_user
    @inbox.seen = false
    @inbox.inbox_hidden = false
    if @inbox.user2_id == nil
      flash[:notice] = "El destinatario no es valido."
    end
    respond_to do |format|
      if @inbox.save
        format.html { redirect_to @inbox, notice: 'Mensaje enviado correctamente' }
        format.json { render :show, status: :created, location: @inbox }
      else
        format.html { render :new }
        format.json { render json: @inbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inboxes/1
  # PATCH/PUT /inboxes/1.json
  def update
    respond_to do |format|
      if @inbox.update(inbox_params)
        format.html { redirect_to @inbox, notice: 'Mensaje actualizado correctamente' }
        format.json { render :show, status: :ok, location: @inbox }
      else
        format.html { render :edit }
        format.json { render json: @inbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inboxes/1
  # DELETE /inboxes/1.json
  def destroy
    @inbox.destroy
    respond_to do |format|
      format.html { redirect_to inboxes_url, notice: 'Mensaje borrado correctamente' }
      format.json { head :no_content }
    end
  end

  def deleteInbox
    inbox = Inbox.find(params[:id])
    inbox.hide_for_receiver
    redirect_to inboxes_url
  end

  def delete_for_sender
    inbox = Inbox.find(params[:id])
    inbox.hide_for_sender
    redirect_to inboxes_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inbox
      @inbox = Inbox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inbox_params
      params.require(:inbox).permit(:subject, :content, :user1_id, :user2_id, :inbox_att)
    end
end
