# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
GossipTag.destroy_all
PrivateMessage.destroy_all
PrivateMessageRecipient.destroy_all
Comment.destroy_all
Undercomment.destroy_all
Like.destroy_all

10.times do |i|
  City.create!(name: Faker::GameOfThrones.city, zip_code: "1#{i}5#{i}8")
end
 
10.times do
  User.create!(first_name: Faker::Lebowski.unique.character, email: Faker::Internet.email, age: rand(13..45), description: Faker::Lebowski.unique.quote, city: City.all.sample)
end

20.times do
  Gossip.create!(title: Faker::Pokemon.name, content: Faker::RickAndMorty.unique.quote, author: User.all.sample)
end

10.times do
  Tag.create!(title: "#"+Faker::Book.unique.genre)
end

20.times do |i|
  tag_list = Tag.all.shuffle                                    # On ne veut pas toujours attribuer le même tag en premier, tout en s'assurant de ne pas attribuer plusieurs fois le même tag au même gossip
  tag_number = rand(1..10)                                      # 1 à 10 tags par Gossip
  tag_number.times do |j|
    GossipTag.create!(gossip: Gossip.all[i], tag: tag_list[j])
  end
end

10.times do |i|
  envoyeur = User.all.sample
  PrivateMessage.create!(sender: envoyeur, content: Faker::HowIMetYourMother.catch_phrase)
end

20.times do
  PrivateMessageRecipient.create!(private_message: PrivateMessage.all.sample, recipient: User.all.sample)
end

20.times do
  Comment.create!(content: Faker::HowIMetYourMother.catch_phrase, user: User.all.sample, gossip: Gossip.all.sample)
end

20.times do
  if ["pile","face"].sample == "pile"                   # Petit lancer de pièce pour voir si on pose notre like sur un gossip ou sur un comment
    Like.create!(gossip: Gossip.all.sample)
  else
    Like.create!(comment: Comment.all.sample)
  end
end

20.times do
  Undercomment.create!(user: User.all.sample, comment: Comment.all.sample, content: "You think like "+Faker::GreekPhilosophers.name+", I love it. Please give me your number")
end