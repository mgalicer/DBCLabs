class CommentsController < ApplicationController


def create
  @parent = Experiment.find(params[:experiment_id]) if params[:experiment_id]
  @parent = Comment.find(params[:comment_id]) if params[:comment_id]
  @comment = @parent.comments.new(params[:comment])
    if @comment.save
      redirect_to experiment_path(params[:experiment_id])
    else
      render 'new'
    end
  end
end
