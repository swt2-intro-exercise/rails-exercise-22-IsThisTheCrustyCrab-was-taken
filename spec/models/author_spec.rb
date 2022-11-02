require 'rails_helper'

RSpec.describe Author, type: :model do
  # check if author has first_name, last_name and homepage
  it "should have first_name, last_name and homepage" do
    author = Author.new
    expect(author).to respond_to(:first_name)
    expect(author).to respond_to(:last_name)
    expect(author).to respond_to(:homepage)
  end
end
