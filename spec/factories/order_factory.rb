FactoryGirl.define do
  factory :order do
    user {association :user, factory: :user, strategy: :build}
    contact {association :contact, user: user, factory: :contact, strategy: :build}
  end
end