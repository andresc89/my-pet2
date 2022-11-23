# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Loading'
Pet.destroy_all

# 5.times do
#   user = User.new(
#     first_name: Faker::Creature::Dog.name,
#     last_name: Faker::Creature::Dog.name,
#     email: Faker::Internet.email,
#     username: Faker::Internet.username,
#     password: Faker::Internet.password
#   )
#   user.save!
# end

# 5.times do
#   pet = Pet.new(
#     name: Faker::Creature::Dog.name,
#     species: Faker::Creature::Animal.name,
#     price: rand(5..100)
#   )
#   pet.user = User.all.sample
#   pet.save!
# end

puts 'Finished'
