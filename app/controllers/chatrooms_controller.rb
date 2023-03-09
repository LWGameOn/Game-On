class ChatroomsController < ApplicationController
  def index
    chatroom_event = Chatroom.find(params[:event_id])
    my_events = Play.where(user_id == current_user.id)
    @chatrooms = Chatroom.where(chatroom_event.id == my_events.id)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
  end
end
