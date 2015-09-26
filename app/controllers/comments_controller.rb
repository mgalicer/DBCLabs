class CommentsController < ApplicationController
  respond_to :html, :js

  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def new
    @commentable = find_commentable
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    @comment.commenter = current_user

    # respond_to do |format|
    #   format.html { render :new }
    #   format.js { render json: { form: render_to_string("new.html", layout: false) } }
    # end

    if @comment.save
      flash[:notice] = "Successfully created comment."
      respond_to do |format|
        format.html { redirect_to @comment.base_commentable }
        format.json { render json: {html: render_to_string( partial: "comment.html", locals: {comment: @comment, i: @commentable.comments.length}, layout: false)}}
      end
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
