require 'rails_helper'


describe "Paper index page", type: :feature do
  #check if edit link exists
  it "should have a link to edit a paper" do
    @paper = FactoryBot.create :paper
    visit papers_path
    expect(page).to have_link("Edit", :href => edit_paper_path(@paper))
  end
end

