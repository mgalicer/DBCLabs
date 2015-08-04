class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: "User", foreign_key: :commenter_id
  belongs_to :commentable, polymorphic: true

  def base_commentable
    commentable = self.commentable
    while commentable.is_a? Comment
      commentable = commentable.commentable
    end
    commentable
  end

end
