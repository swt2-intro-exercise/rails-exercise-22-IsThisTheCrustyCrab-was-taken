require 'rails_helper'

describe "New author page", type: :feature do
   it "should exist at 'new_author_path' and render withour error" do
     # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
     visit new_author_path
   end
   it "should have text inputs for an author's first name, last name, and homepage" do
     visit new_author_path
     # these are the standard names given to inputs by the Rails form builder
     expect(page).to have_field('author[first_name]')
     expect(page).to have_field('author[last_name]')
     expect(page).to have_field('author[homepage]')
   end
   #fill out form and check if author is found in database
   it "should save the author after submitting the form" do
     visit new_author_path
     # these are the standard names given to inputs by the Rails form builder
     fill_in 'author[first_name]', with: 'Alan'
     fill_in 'author[last_name]', with: 'Turing'
     fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
     find('input[type="submit"]').click
     #check if author is found in database
     expect(Author.where(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')).to exist
   end
   it "should exist at 'author_path' and render withour error" do
     #create alan
     @alan = FactoryBot.create :author
     visit author_path(@alan)
   end
   # check model for validation
   it "should validate the presence of last name" do
     @alan = FactoryBot.build :author_without_last_name
     expect(@alan).to_not be_valid
   end
 end
