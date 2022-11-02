class Author < ApplicationRecord
  #method name that returns full name
  def name
    "#{first_name} #{last_name}"
  end
end
