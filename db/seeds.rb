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
u = User.first
u.update(password: '123456')
u.generate_token_and_save

10.times do
  ong = Ong.create(
    name: Faker::Company.name,
    email: Faker::Internet.email,
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

Ong.first.update_attribute(:change_org_id, 1197750)

circumscription = Circumscription.create(number: 8, name: 'Santiago Oriente')
districts = [{ number: 21 }, { number: 25 }].map do |district_data|
  District.create(district_data.merge({ circumscription: circumscription }))
end

[{ name: 'Ñuñoa' }, { name: 'Providencia' }].each do |municipality_data|
  Municipality.create(municipality_data.merge({ district: districts[0] }))
end

[{ name: 'La Granja' }, { name: 'Macul' }, { name: 'San Joaquín' }].each do |municipality_data|
  Municipality.create(municipality_data.merge({ district: districts[1] }))
end

ps = Party.create(name: 'Partido Socialista', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Emblem_of_the_Socialist_Party_of_Chile.svg/500px-Emblem_of_the_Socialist_Party_of_Chile.svg.png')
rn = Party.create(name: 'Renovación Nacional', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Renovacion_Nacional_2014.svg/512px-Renovacion_Nacional_2014.svg.png')
pdc = Party.create(name: 'Partido Demócrata Cristiano', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Emblem_of_the_Christian_Democrat_Party_of_Chile.svg/442px-Emblem_of_the_Christian_Democrat_Party_of_Chile.svg.png')
ppd = Party.create(name: 'Partido por la Democracia', logo: 'https://upload.wikimedia.org/wikipedia/commons/9/91/Partido_por_la_Democracia_emblema.png')

[
  { name: 'Carlos Montes Cisternas', email: 'cmontes@example.org', photo: 'http://www.senado.cl/appsenado/index.php?mo=comisiones&ac=getImage&fid=1119', party: ps, circumscription: circumscription },
  { name: 'Manuel José Ossandón Irarrázabal', email: 'mjossandon@example.org', photo: 'http://www.senado.cl/appsenado/index.php?mo=comisiones&ac=getImage&fid=1120', party: rn, circumscription: circumscription }
].each { |senator_data| Senator.create(senator_data) }

[
  { name: 'Maya Fernández Allende', email: 'maya.fernandez@example.org', photo: 'https://www.camara.cl/img.aspx?prmid=chs981', party: ps, district: districts[0] },
  { name: 'Marcela Sabat Fernández', email: 'msabat@example.org', photo: 'https://www.camara.cl/img.aspx?prmid=chs949', party: rn, district: districts[0] },
  { name: 'Claudio Arriagada Macaya', email: 'claudio.arriagada@example.org', photo: 'https://www.camara.cl/img.aspx?prmid=chs969', party: pdc, district: districts[1] },
  { name: 'Ramón Farías Ponce', email: 'rfarias@example.org', photo: 'https://www.camara.cl/img.aspx?prmid=chs839', party: ppd, district: districts[1] }
].each { |deputy_data| Deputy.create(deputy_data) }
