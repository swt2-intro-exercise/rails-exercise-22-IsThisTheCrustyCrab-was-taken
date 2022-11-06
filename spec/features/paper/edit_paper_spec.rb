require 'rails_helper'


describe "Show paper page", type: :feature do
  # should have a single multiple select box for selecting authors
  it "should have a single multiple select box for selecting authors" do
    #create paper
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
    expect(page).to have_selector("select[multiple]")
  end
  # select multiple authors and save paper
  it "should select multiple authors and save paper" do
    #create paper
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
    #create author Alan Turing and Grace Hopper
    @alan = FactoryBot.create :author
    @grace = FactoryBot.create :author2
    visit edit_paper_path(@paper)
    #select Alan Turing and Grace Hopper on multiple select box
    find('select[multiple]').find(:option, @alan.name).select_option
    find('select[multiple]').find(:option, @grace.name).select_option
    #click submit button
    find('input[type="submit"]').click
    #check if paper has 2 authors
    expect(@paper.authors.count).to eq(2)
  end
end

