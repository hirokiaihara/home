FactoryBot.define do
  factory :play do
    play_title  {Faker::Lorem.sentence}
    play_image  {File.open("#{Rails.root}/public/images/test_image.jpg")}
    play_introduction {Faker::Lorem.sentence}
    category      {"工作"}
    created_at    {Faker::Time.between(from: DateTime.now - 2, to: DateTime.now)}
    user
  end
end