require 'rails_helper'

describe "Edit author page", type: :feature do
  #when user visits edit page of @alan, no error should occur
  it "should exist at 'edit_author_path' and render withour error" do
    #create alan
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
  end
  #feature changes made to the authors in an edit form should be saved to the database
  it "should save changes to the author after submitting the form" do
    #create alan
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
    # these are the standard names given to inputs by the Rails form builder
    fill_in 'author[first_name]', with: 'Alan Mathison'
    fill_in 'author[last_name]', with: 'Turing'
    fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click
    #check if alan was updated
    @alan.reload
    expect(@alan.first_name).to eq("Alan Mathison")
  end
end
