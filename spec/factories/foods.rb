FactoryBot.define do
  factory :food do
    food_name  {Faker::Lorem.sentence}
    quantity  {Faker::Lorem.sentence}
    recipe
  end
end