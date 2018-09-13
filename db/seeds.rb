# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!( name: "admin",
              email: 'admin@email.com',
              password: 'password',
              password_confirmation: 'password' ,
              admin: true
            )

5.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(	name: name,
  				      email: email,
               	password: password,
               	password_confirmation: password
               )
end

5.times do |i|
  Category.create!( title: "Test #{i}",
                    description: "description #{i}" 
                  )
end

5.times do |i|
  Word.create!( category_id: i+1,
                content: "content #{i}" 
              )
end

5.times do |k|
  2.times do |i|
    Choice.create!( word_id: k+1,
                    content: "false",
                    correct: nil 
                    )
  end

  Choice.create!( word_id: k+1,
                    content: "true",
                    correct: true
                    )
end  