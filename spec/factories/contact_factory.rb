FactoryGirl.define do
  factory :contact do
    name {Faker::Lorem.word}
    province {Faker::Address.state}
    city {Faker::Address.city}
    postal_code {Faker::Address.postcode}
    address {Faker::Address.street_address}
    phone {"1-234-567-8901"}

    association :user, factory: :user, strategy: :build
  end
end