class Category < ApplicationRecord
  has_many :blocks
  has_many :sessions, through: :blocks
  validates :name, presence: true, uniqueness: true
end
