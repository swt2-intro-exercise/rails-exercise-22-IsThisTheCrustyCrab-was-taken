FactoryBot.define do
  #create paper with title, venue and year
  factory :paper do
    title { "COMPUTING MACHINERY AND INTELLIGENCE" }
    venue { "Mind 49: 433-460" }
    year { 1950 }
  end
end