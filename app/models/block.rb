class Block < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :session
  has_many :exercise_sets
  validates :name, presence: true
end
