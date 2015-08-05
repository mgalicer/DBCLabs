class CommentsController < ApplicationController
  respond_to :html, :js

  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def new
    # @parent_comment =
    # @proposal = Proposal.find(params[:proposal_id])
    # @experiment = Experiment.find(params[:experiment_id])
    @commentable = find_commentable

    respond_to do |format|
      format.html { render :new }
      format.js { render json: { form: render_to_string("new.html", layout: false) } }
    end

    # @comment = Comment.new
  end

  def create
    # @parent = Experiment.find(params[:experiment_id]) if params[:experiment_id]
    # @parent = Proposal.find(params[:proposal_id]) if params[:proposal_id]
    # @parent = Comment.find(params[:comment_id]) if params[:comment_id]

    # @comment = @parent.comments.new(params[:comment])
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
      # puts "CURRENT USER"
      # p current_user
    @comment.commenter = current_user
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to @comment.base_commentable
    else
      render 'new'
    end
  end

    def show
      @comments = @parent.comments.all
    end

    private


    def find_commentable
      params.each do | name, value|
        if name =~ /(.+)_id$/
           return $1.classify.constantize.find(value)
          end
        end
          nil
      end

     def comment_params
      params.require(:comment).permit(:content)
    end

end
