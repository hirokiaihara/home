FactoryBot.define do
  factory :recipecomment do
    comment  {Faker::Lorem.sentence}
    user
    recipe
  end
end