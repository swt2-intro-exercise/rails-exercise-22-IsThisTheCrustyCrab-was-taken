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
  #check if user can change the title of a paper
  it "should change the title of a paper" do
    #create paper
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
    #change title of paper
    fill_in 'paper[title]', with: 'New Title'
    find('input[type="submit"]').click
    #check if title was changed
    @paper.reload
    expect(@paper.title).to eq("New Title")
  end
  #check if user can change the venue of a paper
  it "should change the venue of a paper" do
    #create paper
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
    #change venue of paper
    fill_in 'paper[venue]', with: 'New Venue'
    find('input[type="submit"]').click
    #check if venue was changed
    @paper.reload
    expect(@paper.venue).to eq("New Venue")
  end
  #check if user can change the year of a paper
  it "should change the year of a paper" do
    #create paper
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
    #change year of paper
    fill_in 'paper[year]', with: '2019'
    find('input[type="submit"]').click
    #check if year was changed
    @paper.reload
    expect(@paper.year).to eq(2019)
  end
end

