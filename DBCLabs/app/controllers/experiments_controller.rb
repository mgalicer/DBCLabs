class ExperimentsController < ApplicationController
  def index
      @proposals = Proposal.all
      @experiments = Experiment.all
      @comments = Comment.all
    end

    def show
      @proposal = Proposal.find(params[:proposal_id])
      @experiment = Experiment.find(params[:id])
    end

    def create
    end

end
