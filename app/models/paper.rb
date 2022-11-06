class Paper < ApplicationRecord
  #validation for paper
  validates :title, presence: true, length: { minimum: 1 }
  validates :venue, presence: true, length: { minimum: 1 }
  #https://stackoverflow.com/questions/1089436/validate-integer-in-rails
  validates :year, presence: true, numericality: { only_integer: true }
end
