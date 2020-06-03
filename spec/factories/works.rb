FactoryBot.define do
  factory :work do
    work_image   {File.open("#{Rails.root}/public/images/test_image.jpg")}
    work_text    {Faker::Lorem.sentence}
    play
  end
end