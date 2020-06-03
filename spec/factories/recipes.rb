FactoryBot.define do
  factory :recipe do
    recipe_title  {Faker::Lorem.sentence}
    recipe_image  {File.open("#{Rails.root}/public/images/test_image.jpg")}
    recipe_introduction {Faker::Lorem.sentence}
    category      {"お菓子"}
    created_at    {Faker::Time.between(from: DateTime.now - 2, to: DateTime.now)}
    user
  end
end