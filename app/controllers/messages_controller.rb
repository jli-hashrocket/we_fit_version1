class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    inbox = Message.new
    @inbox_messages = current_user.received_messages
  end

end
