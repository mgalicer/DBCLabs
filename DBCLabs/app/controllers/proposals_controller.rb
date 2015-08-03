class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
    @experiments = Experiment.all
    @comments = Comment.all
  end

  def show
    @proposal = Proposal.find(params[:id])
    # @experiments = Experiment.where(proposal_id: proposal.id)
    @experiments = @proposal.experiments.all
    @comments = @proposal.comments.all
  end

  def create
  end

end
