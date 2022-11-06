
require 'rails_helper'

RSpec.describe Paper, type: :model do
  #check if paper initializes with empty list of authors
  it "should have an empty list of authors" do
    paper = Paper.new(title: 'Computing Machinery and Intelligence', venue: 'Mind 49: 433-460', year: 1950)
    expect(paper.authors).to be_empty
  end
end
