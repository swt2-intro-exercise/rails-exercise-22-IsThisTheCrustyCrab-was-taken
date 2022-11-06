require 'rails_helper'


describe "New paper page", type: :feature do
  #check if new paper page exists and has form for title, venue, year and authors
  it "should exist at 'new_paper_path' and render without error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_paper_path
  end
  it "should have text inputs for a paper's title, venue, and year" do
    visit new_paper_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end
  #check if not filling in all fields throws error
  it "should show an error message if title is missing" do
    visit new_paper_path
    # these are the standard names given to inputs by the Rails form builder
    fill_in 'paper[venue]', with: 'Mind 49: 433-460'
    fill_in 'paper[year]', with: '1950'
    find('input[type="submit"]').click
    expect(page).to have_text("Title can't be blank")
  end
  it "should show an error message if venue is missing" do
    visit new_paper_path
    # these are the standard names given to inputs by the Rails form builder
    fill_in 'paper[title]', with: 'Computing Machinery and Intelligence'
    fill_in 'paper[year]', with: '1950'
    find('input[type="submit"]').click
    expect(page).to have_text("Venue can't be blank")
  end
  it "should show an error message if year is missing" do
    visit new_paper_path
    # these are the standard names given to inputs by the Rails form builder
    fill_in 'paper[title]', with: 'Computing Machinery and Intelligence'
    fill_in 'paper[venue]', with: 'Mind 49: 433-460'
    find('input[type="submit"]').click
    expect(page).to have_text("Year can't be blank")
  end
end
