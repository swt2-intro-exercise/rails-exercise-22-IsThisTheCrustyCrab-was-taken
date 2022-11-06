class Paper < ApplicationRecord
  has_and_belongs_to_many :authors
  #validation for paper
  validates :title, presence: true, length: { minimum: 1 }
  validates :venue, presence: true, length: { minimum: 1 }
  #https://stackoverflow.com/questions/1089436/validate-integer-in-rails
  validates :year, presence: true, numericality: { only_integer: true }
  #scope for filtering papers by year
  scope :published_in, ->(year) { where("year = ?", year) }
  def self.published_in(year)
    where("year = ?", year)
  end
end
