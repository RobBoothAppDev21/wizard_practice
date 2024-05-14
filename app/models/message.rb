class Message < ApplicationRecord
  enum :role, { system: 0, assistant: 10, user: 20 }, default: :user

  belongs_to :chat

  def self.for_openai(messages)
    message.map { |message| { role: message.role, content: message.content } }
  end

  def user?
    role == "user"
  end
end
