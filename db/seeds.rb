# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# Création de 10 utilisateurs
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email(name: "#{first_name} #{last_name}", domain: 'yopmail.com')
  User.create(first_name: first_name, last_name: last_name, email: email, password: 'password')
end

=begin
10.times do
  user = User.create!(email: Faker::Internet.free_email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph_by_chars)
end
=end

10.times do
 Event.create!(
  start_date: Time.now + rand(1..30).days,
  duration: rand(1..6) * 5,
  title: Faker::Lorem.sentence(word_count: rand(3..10)),
  description: Faker::Lorem.paragraph_by_chars(number: rand(20..1000)),
  price: rand(1..1000),
  location: Faker::Address.full_address,
  admin_id: rand(1..10)
)
end

10.times do
  user = User.all.sample
  event = Event.all.sample
  Attendance.create!(user: user, event: event, stripe_customer_id: Faker::Alphanumeric.alphanumeric(number: 10))
end