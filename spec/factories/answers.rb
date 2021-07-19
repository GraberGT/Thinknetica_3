FactoryBot.define do
  sequence :answer_title do |n|
    "MyString"
  end

  factory :answer do
    title
    question
  end

  trait :invalid_answer do
    title { nil }
  end
end
