class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all.order('text ASC')
    @messages = @messages.page(params[:page])
    authorize!(:read, @messages)
  end

  def show
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save

        handle_user_messages
        format.html { redirect_to messages_path }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @message.update(message_params)

        handle_user_messages
        format.html { redirect_to messages_path}
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_path }
      format.json { head :no_content }
    end
  end

  private

    def handle_user_messages
      if params[:message][:to_all]== '1'

        users = AdminUser.all
        users.each do |user|
          MessagesUser.create(admin_user_id: user.id, message_id: @message.id)
        end
      else

        params[:users].each do |user|
          MessagesUser.create(admin_user_id: user, message_id: @message.id)
        end
      end
    end

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
        params.require(:message).permit!
    end
end
