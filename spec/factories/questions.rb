FactoryBot.define do
  sequence :title do |n|
    "MyString"
  end

  sequence :body do |n|
    "MyText"
  end

  factory :question do
    title
    body
  end

  trait :invalid_question do
    title { nil }
    body { nil }
  end
end
