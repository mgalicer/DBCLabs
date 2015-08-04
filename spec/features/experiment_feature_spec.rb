require 'rails_helper'

feature "User goes to home page" do
  before :each do
    user1 = User.create!(user_type: "faculty", name: "Roger Rabbit", email: "rr@wu.edu", password: "password")
    prop1 = Proposal.create( title: "The meaning of Life", hypothesis: "The dude abides", summary: "Toke, bowl, clean rug", proposer: user1)
    experiment1 = Experiment.create!( title: "Our take on the meaning of Life", materials: "Bowling balls thai sticks", procedures: "Toke, bowl, clean rug", observations: "So mark it eight", results: "The lilest Lebowski", conclusion: "The dude is the laziest world wide", proposal: prop1, experimenter: user1)
  end


  scenario "when a user goes to home page" do
    visit "/"
    expect(page).to have_content "Welcome to Washington University's Public Health Fund"
  end

  scenario "user sees an experiment's details when they click on an experiment link" do


    visit "/"

    # save_and_open_page
    find("#experiment-list li:first-child a").click
    # click_link(".individual-link")
    expect(page).to have_content "Experiment Overview"


  end
end

