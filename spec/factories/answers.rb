FactoryBot.define do
  factory :answer do
    question_id { 1 }
    title       {'MyText'}

    trait :invalid do
      question_id { nil }
      title       { nil }
    end
  end
end
