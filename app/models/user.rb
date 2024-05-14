class User < ApplicationRecord
  # Include default devise modules. Others available are: :omniauthable
  devise :confirmable,
         :database_authenticatable,
         :lockable,
         :recoverable,
         :registerable,
         :rememberable,
         :timeoutable,
         :trackable,
         :validatable
  
  has_many :chats, dependent: :destroy
end
