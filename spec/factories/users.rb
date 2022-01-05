FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    total_orders_pln { 1 }
    total_orders_eur { 1 }
  end
end
