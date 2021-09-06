class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user

    @chatroom = Chatroom.find(params[:chatroom_id])
    @message.chatroom = @chatroom

    if @message.save
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
