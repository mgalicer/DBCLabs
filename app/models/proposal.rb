class Proposal < ActiveRecord::Base
  belongs_to :proposer, class_name: "User", foreign_key: :proposer_id

  has_many :experiments
  has_many :comments, as: :commentable

  def base_commentable
    self
  end
end
