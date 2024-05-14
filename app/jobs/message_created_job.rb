class MessageCreatedJob < ApplicationJob
  queue_as :default

  def perform(message)
    @message = message

    system_message = ChatService.call(@message.chat, messages)
    # Do something later

    Turbo::StreamsChannel.broadcast_append_to(
      "messages_#{message.chat.id}",
      target: "messages_#{message.chat.id}",
      partial: "messages/message",
      locals: { message: system_message }
    )
  end

  def messages
    @message
      .chat
      .messages
      .order(created_at: :asc)
      .map do |m|
        {
          content: m.content,
          role: m.role
        }
      end
  end
end
