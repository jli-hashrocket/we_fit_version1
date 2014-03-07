class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def inbox
    @inbox_messages = current_user.received_messages
  end

  def sent
    @outbox_messages = current_user.sent_messages
  end

  def show
    @message = Message.find(params[:id])
    @sender = User.find(@message.sender_id)
    if @message.is_inbox_message?(current_user.id)
      @read_message = Message.reading_message(@message.id, @message.recipient_id)
    else
      @read_message = @message
    end
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to @message, notice: "You have sent a message to #{@message.username}!"
    else
      render :new
    end
  end

  private
  def message_params
    params.require(:message).permit(:subject, :body, :sender_id, :recipient_id, :read_at, :sender_deleted, :recipient_deleted)
  end
end
