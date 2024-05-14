class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat, only: %i[show]
  
  def index
    @chats = current_user.chats
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def create
    @chat = Chat.create!(user: current_user)
    
    redirect_to chat_path(@chat)
  end

  private
  
  def set_chat
    @chat = Chat.find(params[:id])
  end
end
