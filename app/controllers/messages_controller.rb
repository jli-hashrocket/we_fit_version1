class MessagesController < ApplicationController
  before_filter :set_user

  def index
    if params[:mailbox] == "sent"
      @messages = @user.sent_messages
    elsif params[:mailbox] == "inbox"
      @messages = @user.received_messages
    end
  end
end
