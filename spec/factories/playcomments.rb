FactoryBot.define do
  factory :playcomment do
    comment  {Faker::Lorem.sentence}
    user
    play
  end
end