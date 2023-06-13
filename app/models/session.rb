class Session < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  has_many :blocks, dependent: :destroy
  has_many :categories, through: :blocks
  validates :user, :sport, :date, presence: true
end
