# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.where(email: "bob@bob.bob", name: "bob boberson").first_or_create(password: "password", password_confirmation: "password")

f1 = Flower.where(name: "lilly", description: "a lilly", price: 5.00).first_or_create(stock: 100)
File.open("app/assets/images/lilly.jpg") do |f|
  f1.image = f
  f1.save
end
f2 = Flower.where(name: "rose", description: "a rose", price: 7.00).first_or_create(stock: 100)
File.open("app/assets/images/rose.jpg") do |f|
  f2.image = f
  f2.save
end
f3 = Flower.where(name: "tulip", description: "a tulip", price: 2.00).first_or_create(stock: 100)
File.open("app/assets/images/tulip.jpg") do |f|
  f3.image = f
  f3.save
end

o = Order.where(user: u, status: "in_progress").first_or_create()

OrdersFlower.where(order: o, flower: f1, quantity: 3).first_or_create()
OrdersFlower.where(order: o, flower: f2, quantity: 12).first_or_create()
OrdersFlower.where(order: o, flower: f3, quantity: 7).first_or_create()
