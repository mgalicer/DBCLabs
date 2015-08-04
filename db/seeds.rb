require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Proposal.destroy_all
Experiment.destroy_all


# user1 = User.create!(user_type: "faculty", name: "Roger Rabbit", email: "rr@wu.edu", password: "password")

# user2 = User.create!(user_type: "faculty", name: "Marci Dolphin", email: "md@wu.edu", password: "password")

# prop1 = Proposal.create( title: "The meaning of Life", hypothesis: "The dude abides", summary: "Toke, bowl, clean rug", proposer: user1)

# prop2 = Proposal.create( title: "Where is Bermuda Triangle", hypothesis: "Twilight Zone", summary: "This is stranger than fiction", proposer: user2)

# experiment1 = Experiment.create!( title: "Our take on the meaning of Life", materials: "Bowling balls thai sticks", procedures: "Toke, bowl, clean rug", observations: "So mark it eight", results: "The lilest Lebowski", conclusion: "The dude is the laziest world wide", proposal: prop1, experimenter: user1)


# experiment2 = Experiment.create!( title: "Our take on Triangles", materials: "triangles pyramids", procedures: "Fly yo plane over the Bermuda Triangle and Bail out", observations: "We did not vanish", results: "The enigma remains", conclusion: "The stuff is overrated", proposal: prop2, experimenter: user2)
faculty = User.create!(user_type: "faculty", name: "pete", email: Faker::Internet.email, password: 'password' )
labstaff = User.create!(user_type: "labstaff", name: "brian", email: Faker::Internet.email, password: 'password' )
15.times do
  faculty = User.create!(user_type: "faculty", name: Faker::Name.name, email: Faker::Internet.email, password: 'password' )
  labstaff = User.create!(user_type: "lab staff", name: Faker::Name.name, email: Faker::Internet.email, password: 'password' )
  users = [faculty, labstaff]
  prop = Proposal.create!( title: Faker::Lorem.sentence, hypothesis: Faker::Lorem.paragraph, summary: Faker::Lorem.paragraphs.first, proposer: faculty)
  experiment = Experiment.create!( title: Faker::Lorem.sentence, materials: Faker::Lorem.words.join(""), procedures: Faker::Lorem.sentence, observations: Faker::Lorem.sentence, results: Faker::Lorem.sentence, conclusion: Faker::Lorem.sentence, proposal: prop, experimenter: labstaff)
  prop.comments.create!(content: Faker::Lorem.sentence, commenter: users.sample)
  experiment.comments.create!(content: Faker::Lorem.sentence, commenter: users.sample)
end
