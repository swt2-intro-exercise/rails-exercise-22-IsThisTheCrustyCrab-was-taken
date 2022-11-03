FactoryBot.define do
  factory :author do
     first_name { "Alan" }
     last_name { "Turing" }
     homepage { "http://wikipedia.de/Alan_Turing" }
  end
  #factory for author without last name
  factory :author_without_last_name, class: Author do
    first_name { "Alan" }
    homepage { "http://wikipedia.de/Alan_Turing" }
  end
end
