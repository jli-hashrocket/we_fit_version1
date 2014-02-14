class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @inbox_messages = current_user.received_messages
  end

  def sent
    @outbox_messages = current_user.sent_messages
  end

end
