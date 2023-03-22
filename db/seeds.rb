# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create(username:'admin', email:'admin@example.com', password:'admin_password123', status:0)
puts 'create admin user'
User.create(username:'user_one', email:'user_1@example.com', password:'user_password123', status:2)
puts 'create user'

category1 = Category.create(name:'manhwa')
puts 'create manhwa created'
category2 = Category.create(name: 'action')
puts 'create action created'
category3 = Category.create(name: 'martial arts')
puts 'create martial arts created'

manga = Manga.create(title:'Post-Pandemic',
 description:"One day, a suspected Ars24 variant patient who had been brought to Korea University Hospital escaped. Feeling responsible for missing the patient he was in charge of, Jeong Yoo-hyeon, a professor of infectious medicine, decides to start searching for the patient and heads to Surak Village in Hwaseong City, where the patient was last seen. And they bump into something at the entrance of the village..., A height of up to 2m, a body much larger than that of a normal adult man, a carcass of an animal in his hand, blood-stained and torn clothes, and a man with an old man's face, but it is hard to see him as an old man.",
 status:1,
 categories: [category1.name, category2.name],
 author: 'JwangJwang Saniga Han'
	)
manga.thumbnail.attach(io: File.open("#{Rails.root}/app/assets/images/post-pandemic.jpg"), filename: 'post-pandemic.jpg')
 puts 'first manga created'


manga2 = Manga.create(title:'Reincarnated Escort Warrior',
 description:"My dream is to become an escort warrior that rides on a cool horse and transports goods. But I’ve got a limp leg and I’m unable to learn decent martial arts. I’ve lived as a porter working odd jobs for the entirety of my life. Until I died because of the mountain bandits that I met during an escort mission. But… ‘I became the fourth young master, Lee Jungryong?!’ When I died and woke up, I was reborn as the Heavenly Dragon Escort Agency’s infamous good-for-nothing youngest son. The weakling, Lee Jungryong, will become the best escort warrior in this life!",
 status:1,
 categories: [category1.name, category2.name, category3.name],
 author: 'updating'
	)
manga2.thumbnail.attach(io: File.open("#{Rails.root}/app/assets/images/reincarnated-escort-warrior.png"), filename: 'reincarnated-escort-warrior.png')
 puts 'first manga created'