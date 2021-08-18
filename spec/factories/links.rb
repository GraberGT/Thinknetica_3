FactoryBot.define do
  factory :link do
    name { "Thinknetica" }
    url { "http://thinknetica.com" }
  end

  trait :gist_link do
    name { "Gist" }
    url { "https://gist.github.com/grabergt/7fcdfb3aea61cf132185e928aebab986" }
  end
end
