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
    if current_user.id == @message.sender_id
      @read_message = Message.reading_message(@message.id, @message.recipient_id)
    else
      @read_message = @message
    end
  end

  private
  def message_params
    params.require(:message).permit(:subject, :body, :sender_id, :recipient_id, :read_at, :sender_deleted, :recipient_deleted)
  end
end
