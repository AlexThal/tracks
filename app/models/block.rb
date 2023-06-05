class Block < ApplicationRecord
  belongs_to :category
  belongs_to :session
  has_many :sets
  validates :name, presence: true
end
