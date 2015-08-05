class ExperimentsController < ApplicationController
  respond_to :html, :js

  def index
      @proposals = Proposal.all
      @experiments = Experiment.order("created_at DESC")
      @comments = Comment.all
      @status_options = ['open', 'closed']
    end

    def show

      # @proposal = Proposal.find(params[:proposal_id])
      @experiment = Experiment.find(params[:id])
      @comments = @experiment.comments
    end

    def new
      @experiment = Experiment.new
      @proposal = Proposal.find(params[:proposal_id])
      @status_options = ['open', 'closed']

    end

    def create
      @proposal = Proposal.find(params[:proposal_id])
      @experiment = @proposal.experiments.new(experiment_params)
      @experiment.experimenter = current_user
      if @experiment.save
        redirect_to @experiment
      else
        render :new
      end

    end

    private
    def experiment_params
      params.require(:experiment).permit(:status, :title, :materials, :procedures, :observations, :results, :conclusion)
    end

end
