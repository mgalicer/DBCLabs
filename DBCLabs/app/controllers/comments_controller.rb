class CommentsController < ApplicationController

  def index
  end

  def new
    @proposal = Proposal.find(params[:proposal_id])
    @comment = Comment.new
  end

  def create
    @parent = Experiment.find(params[:experiment_id]) if params[:experiment_id]
    @parent = Proposal.find(params[:proposal_id]) if params[:proposal_id]
    @parent = Comment.find(params[:comment_id]) if params[:comment_id]

    @comment = @parent.comments.new(content: params[:comment])
      if @comment.save
        redirect_to @comment.base_commentable
      else
        render 'new'
      end
    end

    def show
      @comments = @parent.comments
    end

end
