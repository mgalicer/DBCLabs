class Experiment < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :experimenter, class_name: "User", foreign_key: :experimenter_id
  has_many :comments, as: :commentable

end
