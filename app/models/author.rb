class Author < ApplicationRecord
  #method name that returns full name
  def name
    "#{first_name} #{last_name}"
  end
  #validation for author
  validates :last_name, presence: true, length: { minimum: 1 }

end
