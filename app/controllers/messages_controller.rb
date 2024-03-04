class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user

    if @message.save
      # Instead of retidecting to the same page
      # redirect_to chatroom_path(@chatroom)
      # We want to broadcast each messages to the chat
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      # Sends an HTTP response (200) and an empty body, 
      # indicating that the request has been successfully processed 
      # but doesn't return any content
      head :ok
    else
      render "chatroom/show", status: :unprocessable_entity
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
