class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :username, :email, presence: true, uniqueness: true

  has_many :sessions
  has_many :sports, through: :sessions

  has_many :friendships
  has_many :friends, through: :friendships, foreign_key: "friend_id"
end
