# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Example User",
             email: "example1@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             postal_code:           "3330034",
             address:    "埼玉県川口市並木3丁目",
             phone_number:      "0478888888")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  postal_code = "3330034"
  address = "埼玉県川口市並木3丁目"
  phone_number = "0478888888"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               postal_code:        postal_code,
               address:                address,
               phone_number:      phone_number)
end
