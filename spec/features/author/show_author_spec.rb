#stub for spec
# Path: spec/features/author/show_author_spec.rb
require 'rails_helper'

describe "Show author page", type: :feature do
  #visit page of @alan and check if details are on page
  it "should display the author's details" do
    #create alan
    @alan = FactoryBot.create :author
    visit author_path(@alan)
    expect(page).to have_text("Alan Turing")
    expect(page).to have_text("http://wikipedia.de/Alan_Turing")
  end
  #check if page has link to delete author
  it "should have a link to delete the author" do
    #create alan
    @alan = FactoryBot.create :author
    visit author_path(@alan)
    expect(page).to have_link("Delete", :href => author_path(@alan))
  end
end

