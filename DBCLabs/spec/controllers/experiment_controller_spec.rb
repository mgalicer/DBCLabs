require 'rails_helper'

describe ExperimentsController do

  let!(:experiment) {Experiment.create!(title: "Our take on the meaning of Life", materials: "Bowling balls thai sticks", procedures: "Toke, bowl, clean rug", observations: "So mark it eight", results: "The lilest Lebowski", conclusion: "The dude is the laziest world wide", proposal: prop1, experimenter: user1)}
end
