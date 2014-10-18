class Admin::ClientMessagesController < Admin::BaseController

  before_action :set_client_message, only: [:show, :edit, :update, :destroy, :process_message]

  def index
    @client_messages = ClientMessage.order('processed ASC').all
  end

  def show
  end

  def new
    @client_message = ClientMessage.new
  end

  def edit
  end

  def create
    @client_message = ClientMessage.new(client_message_params)

    respond_to do |format|
      if @client_message.save
        format.html { redirect_to admin_client_messages_path, notice: 'ClientMessage was successfully created.' }
        format.json { render :show, status: :created, location: @client_message }
      else
        format.html { render :new }
        format.json { render json: @client_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @client_message.processed = true
      if @client_message.update(client_message_params)
        format.html { redirect_to admin_client_messages_path, notice: 'ClientMessage was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_message }
      else
        format.html { render :edit }
        format.json { render json: @client_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client_message.destroy
    respond_to do |format|
      format.html { redirect_to admin_client_messages_path, notice: 'ClientMessage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def process_message
    @client_message.processed = true
    @client_message.save
    redirect_to admin_client_messages_path, notice: t('client_message.marked_as_processed')
  end

  private

  def set_client_message
    @client_message = ClientMessage.find(params[:id])
  end

  def client_message_params
    params.require(:client_message).permit(:comment)
  end
end
