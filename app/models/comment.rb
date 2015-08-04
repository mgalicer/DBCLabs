class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: "User", foreign_key: :commenter_id
  belongs_to :commentable, polymorphic: true

  def base_commentable
    self.commentable.try(:base_commentable) || self
  end

end
