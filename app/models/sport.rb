class Sport < ApplicationRecord
  has_many :sessions
  validates :name, presence: true, uniqueness: true
end
