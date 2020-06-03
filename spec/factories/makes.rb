FactoryBot.define do
  factory :make do
    make_image   {File.open("#{Rails.root}/public/images/test_image.jpg")}
    make_text    {Faker::Lorem.sentence}
    recipe
  end
end