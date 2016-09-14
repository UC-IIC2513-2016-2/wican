# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

# al primer usuario le cambiaremos la password a "123456" para tener una cuenta fácil de usar
User.first.update(password: '123456')

10.times do
  ong = Ong.create(
    name: Faker::Company.name,
    email: Faker::Internet.email,
    logo: Faker::Company.logo,
    description: Faker::Lorem.sentences(2).join(' '),
    webpage: Faker::Internet.url
  )
  rand(5..10).times do
    ong.initiatives << Initiative.new(
      title: Faker::Hipster.sentence,
      description: Faker::Hipster.paragraph,
      image: Faker::Placeholdit.image('350x350'),
      active: Faker::Boolean.boolean,
      hashtag: "##{Faker::Hipster.word}"
    )
  end
end
