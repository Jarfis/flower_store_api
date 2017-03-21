FactoryGirl.define do
  factory :flower do
    name {Faker::Lorem.word}
    description {Faker::Lorem.paragraph(2)}
    price {((rand *10) +1).round(2)}
    stock {rand(90)+10}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, "spec", "support", "flowers", "images", "valid_image.jpg"))}
  end
end