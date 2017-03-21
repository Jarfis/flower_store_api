#i think this factory may not be strictly necesary
FactoryGirl.define do
  factory :orders_flower do
    association :order, factory: :order, strategy: :build
    association :flower, factory: :flower, strategy: :build
    
    quantity {rand(9) +1}
  end
end