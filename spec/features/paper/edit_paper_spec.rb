require 'rails_helper'


describe "Show paper page", type: :feature do
  # should have a single multiple select box for selecting authors
  it "should have a single multiple select box for selecting authors" do
    #create paper
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
    expect(page).to have_selector("select[multiple]")
  end
end

