require 'rails_helper'


describe "Show paper page", type: :feature do
  # given a paper with a name, venue and year check if details are on page
  it "should display the paper's details" do
    #create paper
    @paper = FactoryBot.create :paper
    visit paper_path(@paper)
    expect(page).to have_text("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(page).to have_text("Mind 49: 433-460")
    expect(page).to have_text("1950")
  end
end
