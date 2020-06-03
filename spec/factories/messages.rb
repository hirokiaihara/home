FactoryBot.define do
  factory :message do
    message_text    {Faker::Lorem.sentence}
    message_image   {File.open("#{Rails.root}/public/images/test_image.jpg")}
    user
    group
  end
end