# frozen_string_literal: true

class ChatService

  def self.call(chat, messages)
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: messages,
        temperature: 0.7,
        max_tokens: 150
      }
    )
      
    system_message = Message.create!(
      role: "system",
      content: response.dig("choices", 0, "message", "content"),
      chat: chat
    )

    system_message
  end

  private

  def self.client
    @_client ||= OpenAI::Client.new(access_token: Rails.application.credentials.open_ai_api_key)
  end
end