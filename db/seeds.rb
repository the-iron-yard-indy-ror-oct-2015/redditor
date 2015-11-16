# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  user = User.new
  user.email = Faker::Internet.email
  user.name = Faker::Name.name
  user.username = Faker::Internet.user_name
  user.password = Faker::Internet.password
  user.password_confirmation = user.password
  user.save!
  50.times do
    link = Link.new
    link.title = Faker::Book.title
    link.url = Faker::Internet.url
    link.summary = Faker::Lorem.sentences(2).join("\n\n")
    link.tag_names = Faker::Lorem.words(4).join(", ")
    link.user = user
    link.created_at = Faker::Time.between(6.months.ago, DateTime.now)
    link.save!
  end
end
