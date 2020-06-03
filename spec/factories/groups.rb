FactoryBot.define do
  factory :group do
    group_name  {Faker::Team.name}
    created_user_id  {1}
  end
end