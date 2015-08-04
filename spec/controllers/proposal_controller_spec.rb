require 'rails_helper'

describe ProposalsController do
  let!(:user) {User.create!(user_type: "faculty", name: "Roger Rabbit", email: "rr@wu.edu", password: "password")
}
  let!(:proposal) { Proposal.create!( title: "Where is Bermuda Triangle", hypothesis: "Twilight Zone", summary: "This is stranger than fiction", proposer: user) }

  describe "GET #index" do
    it "assigns all proposals as @proposals" do
      get :index
      expect(assigns(:proposals)).to eq(Proposal.all)
    end
  end

  describe "GET #show" do
    it "assigns the requested proposal as @proposal" do
      get :show, { id: proposal.to_param }
      expect(assigns(:proposal)).to eq(proposal)
    end

  #   it "assigns winner throw" do
  #     get :show, { id: proposal.to_param }
  #     expect(assigns(:winner_throw)).to eq(proposal.winner_throw)
  #   end

  #   it "assigns loser throw" do
  #     p game.to_param
  #     get :show, {id: game.to_param}
  #     expect(assigns(:loser_throw)).to eq(game.loser_throw)
    end
  end

