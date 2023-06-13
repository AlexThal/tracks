class Session < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  has_many :blocks
  has_many :categories, through: :blocks
  validates :user, :sport, :date, presence: true
  has_one_attached :photo
end
