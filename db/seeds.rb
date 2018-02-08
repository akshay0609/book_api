# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'

puts "Creating dummy data .........."

PROFILE_IMAGE = ["p1.jpg", "p2.jpg", "p3.jpg"]

1.upto(1000) do |index|
	Author.create!(name: Faker::Book.author, 
		author_bio: Faker::Lorem.paragraph(1, true, 3), 
		profile_pic: "bookApi/tmp/image/" + PROFILE_IMAGE.shuffle.sample		, 
		academics: Faker::Lorem.sentences(3), 
		awards: Faker::Lorem.sentences(5))
end
puts "Author Data Created"

1.upto(5000) do |index|
	Book.create!(name: Faker::Book.title,
	  short_description: Faker::Lorem.paragraph(2, true, 5),
	  long_description: Faker::Lorem.paragraph(7, true, 5),
	  chapter_index: rand(1...20),
	  date_of_publication: Faker::Date.backward(rand(1...20)),
	  genre: Faker::Book.genre,
	  author: Author.all.sample)
end
puts "Books Data Created"

puts "Creating review dummy data .........."
puts "it will take time"

1.upto(25000) do |index|
	Review.create!(name: Faker::Name.name,
		rating: rand(1..5),
		title: Faker::Lorem.characters(10),
		description: Faker::Lorem.paragraph(2, true, 5),
		book: Book.all.sample)  
end
puts "Reviws Data Created"

puts "******************************************"
puts "All Dummy Data Created"
