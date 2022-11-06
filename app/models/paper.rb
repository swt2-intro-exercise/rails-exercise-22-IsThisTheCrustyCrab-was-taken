class Paper < ApplicationRecord
  #validation for paper
  validates :title, presence: true, length: { minimum: 1 }
  validates :venue, presence: true, length: { minimum: 1 }
  validates :year, presence: true, length: { minimum: 1 }
end
