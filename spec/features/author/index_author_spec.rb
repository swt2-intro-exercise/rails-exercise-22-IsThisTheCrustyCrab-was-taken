require 'rails_helper'


describe "Author index page", type: :feature do

  #check if index page exists and has table of all authors containing name, homepage and link to author page
  it "should exist at 'authors_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit authors_path
  end
  it "should have a table with all authors" do
    @alan = FactoryBot.create :author
    visit authors_path
    expect(page).to have_text("Alan Turing")
    expect(page).to have_text("http://wikipedia.de/Alan_Turing")
    expect(page).to have_link("Show", :href => author_path(@alan))
  end
  #check if index page has link to create new author
  it "should have a link to create a new author" do
    visit authors_path
    expect(page).to have_link("New", :href => new_author_path)
  end
end
