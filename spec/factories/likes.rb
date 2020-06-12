FactoryBot.define do
  factory :like do
    association :play
    association :user
  end
end