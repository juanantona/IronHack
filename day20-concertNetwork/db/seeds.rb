# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bands = ["Guns'n'Roses", "The Beatles", "The Rolling Stones", "The Doors", "Elvis Presley", "Dire Straits", "Creadence Clearwater Revival", "U2"]
venues = ["Santiago Bernabeu", "Wembley Stadium", "Maracana", "The Cave", "Slane castle"]
cities = ["Madrid", "London", "New York", "Manchester", "Los Angeles", "Dublin"]


i=0
for i in 0..20
  Concert.new({band: bands.sample, venue: venues.sample, city: cities.sample, date: rand(20).week.ago, price: 100}).save
end 

