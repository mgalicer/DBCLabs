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

user1 = User.create!(user_type: "faculty", name: "Roger Rabbit", email: "rr@wu.edu", password: "password")

user2 = User.create!(user_type: "faculty", name: "Marci Dolphin", email: "md@wu.edu", password: "password")

prop1 = Proposal.create( title: "The meaning of Life", hypothesis: "The dude abides", summary: "Toke, bowl, clean rug", proposer: user1)

prop2 = Proposal.create( title: "Where is Bermuda Triangle", hypothesis: "Twilight Zone", summary: "This is stranger than fiction", proposer: user2)

experiment1 = Experiment.create!( title: "Our take on the meaning of Life", materials: "Bowling balls thai sticks", procedures: "Toke, bowl, clean rug", observations: "So mark it eight", results: "The lilest Lebowski", conclusion: "The dude is the laziest world wide", proposal: prop1, experimenter: user1)


experiment2 = Experiment.create!( title: "Our take on Triangles", materials: "triangles pyramids", procedures: "Fly yo plane over the Bermuda Triangle and Bail out", observations: "We did not vanish", results: "The enigma remains", conclusion: "The stuff is overrated", proposal: prop2, experimenter: user2)

