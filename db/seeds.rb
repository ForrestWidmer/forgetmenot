require 'faker'

rand(4..10).times do
  password = Faker::Lorem.characters(10)
  u = User.new(
    name: Faker::Name.name, 
    email: Faker::Internet.email, 
    password: password, 
    password_confirmation: password)
  u.skip_confirmation!
  u.save

  # by calling `User.new` instead of `create`,
  # we create an instance of a user which isn't saved to the database.
  # The `skip_confirmation!` method sets the confirmation date
  # to avoid sending an email. The `save` method updates the database.

  rand(5..12).times do
    p = u.texts.create(
      title: Faker::Lorem.words(rand(1..3)).join(" "), 
      message: Faker::Lorem.paragraphs(rand(1..4)).join("\n"))
    # set the created_at to a time within the past year
    p.update_attribute(:created_at, Time.now - rand(600..31536000))
  end
end

u = User.new(
  name: "Forrest", 
  email: "forrest.widmer@gmail.com", 
  password: "helloworld", 
  password_confirmation: "helloworld")
u.skip_confirmation!
u.save

puts "Seed Finished"
puts "#{User.count} Users created."
puts "#{Text.count} Texts created."