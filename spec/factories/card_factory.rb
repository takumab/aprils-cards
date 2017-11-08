FactoryBot.define do
  factory :card do
    title { Faker::Name.title }
    description { Faker::Lorem.sentence }
    price { Faker::Commerce.price }
    user
  end
end
