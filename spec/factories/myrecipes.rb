FactoryBot.define do
  factory :myrecipe do
    association :recipe
    association :user
  end
end