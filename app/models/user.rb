class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validate :password_length
  validates :email, format: {with: /\w*@(staff.wuphf.edu)/i }

  has_many :proposals, foreign_key: :proposer_id
  has_many :experiments, foreign_key: :experimenter_id
  has_many :comments, foreign_key: :commenter_id

  require 'bcrypt'

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(params)
    user = self.find_by(name: params[:name])
    if user && user.password == params[:password]
      user
    else
      nil
    end
  end

  private
    def raw_password
      @raw_password ||  ""
    end

    def password_length
      if raw_password || new_record?
        if raw_password.length < 6
           errors.add(:password, "Must be at least 6 characters long!")
        end
      end
    end
end
