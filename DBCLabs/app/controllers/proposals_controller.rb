class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
    @experiments = Experiment.order("created_at DESC").limit(10)
  end

  def show
    @proposal = Proposal.find(params[:proposal_id])
    p @proposal
    # @experiments = Experiment.where(proposal_id: proposal.id)
    @experiments = @proposal.experiments.all
    @comments = @proposal.comments.all
  end

  def create
  end

end
