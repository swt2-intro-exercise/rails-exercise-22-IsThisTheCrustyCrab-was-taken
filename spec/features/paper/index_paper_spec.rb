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
  # check if visiting index page with url parameter year shows only papers of that year
  it "should show only papers of a given year" do
    #create paper
    @paper = FactoryBot.create :paper
    #create paper with year 2018
    @paper2 = FactoryBot.create :paper
    @paper2.title = "New Title"
    @paper2.year = 2018
    @paper2.save
    visit papers_path(:year => @paper.year)
    expect(page).to have_text(@paper.title)
    #check if page does not have paper with year 2018
    expect(page).to_not have_text(@paper2.title)
  end
end

