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
  name = Faker::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(	name: name,
  				      email: email,
               	password: password,
               	password_confirmation: password
               )
end

30.times do |n|
  content = Faker::HarryPotter.character
  content = Faker::HarryPotter.spell
  category = Category.create( title: "Test #{n+1}",
                    description: "description #{n+1}" 
                  )

  5.times do |i|
    word = category.words.build(content: "content#{n+1}")

    3.times do |x|
      word.choices.build(content: content
                         )
    end

    r = rand(0..2)
    word.choices[r].correct = true

    word.save


  end  
end

