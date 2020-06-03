FactoryBot.define do
  factory :material do
    material_name  {Faker::Lorem.sentence}
    play
  end
end