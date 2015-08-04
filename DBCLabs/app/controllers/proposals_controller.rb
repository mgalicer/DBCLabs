class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
    @experiments = Experiment.order("created_at DESC").limit(10)
  end

  def show
    @proposal = Proposal.find(params[:id])
    p @proposal
    @experiments = @proposal.experiments.all
    @comments = @proposal.comments.all
  end

  def new
    @proposal = Proposal.new
  end

  def create
    user = User.find(session[:user_id])
    @proposal = Proposal.new(proposal_params)
    @proposal.proposer = user
    if @proposal.save
      redirect_to @proposal
    else
      render :new
    end
  end


private
  def proposal_params
    params.require(:proposal).permit(:title, :hypothesis, :summary)
  end

end
