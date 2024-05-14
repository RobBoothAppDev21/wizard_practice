class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat

  def create
    @message = @chat.messages.create(messages_params)
    if @message.save
      MessageCreatedJob.perform_later(@message)

      render turbo_stream: turbo_stream.append(
        "messages_#{@chat.id}",
        partial: "messages/message",
        locals: { message: @message }
      )
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private

  def messages_params
    params.require(:message).permit(:content)
  end

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end
end
