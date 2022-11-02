#stub for spec
# Path: spec/features/author/show_author_spec.rb
require 'rails_helper'

describe "Show author page", type: :feature do

  #visit page of @alan and check if it exists
  it "should exist at 'author_path' and render withour error" do
    # create author alan turing
    @alan = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')
    @alan.save
    visit author_path(@alan)
  end
end

