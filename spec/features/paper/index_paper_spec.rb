require 'rails_helper'


describe "Paper index page", type: :feature do
  #check if edit button exists
  it "should have a link to edit a paper" do
    @paper = FactoryBot.create :paper
    visit papers_path
    expect(page).to have_link("Edit", :href => edit_paper_path(@paper))
  end
  #check if index page has button to delete paper
  it "should have a link to delete a paper" do
    @paper = FactoryBot.create :paper
    visit papers_path
    expect(page).to have_link("Delete", :href => paper_path(@paper))
  end
  #check if deleting paper decreases number of papers in database
  it "should delete a paper" do
    @paper = FactoryBot.create :paper
    count = Paper.count
    #click on delete link for alan on index page
    visit papers_path
    # click Delete link and confirm deletion
    click_link('Delete', :href => paper_path(@paper))
    #check if number of authors decreased by 1
    expect(Paper.count).to eq(count-1)
  end
end

