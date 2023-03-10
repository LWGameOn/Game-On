class ChatroomsController < ApplicationController
  def index
    @chatrooms = if params[:event_name].present?
                   current_user.chatrooms.search_by_event_name(params[:event_name])
                 else
                   current_user.chatrooms
                 end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
