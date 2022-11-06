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
  #check if index page has link to delete author
  it "should have a link to delete an author" do
    @alan = FactoryBot.create :author
    visit authors_path
    expect(page).to have_link("Delete", :href => author_path(@alan))
  end
  #check if deleting author decreases number of authors in database
  it "should delete an author" do
    @alan = FactoryBot.create :author
    count = Author.count
    #click on delete link for alan on index page
    visit authors_path
    # click Delete link and confirm deletion
    click_link('Delete', :href => author_path(@alan))
    #check if number of authors decreased by 1
    expect(Author.count).to eq(count-1)
  end
end
