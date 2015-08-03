class UsersController < ApplicationController
  def new
    @user_options = ["faculty", "lab staff"]
  end

  def create
    @user = User.new(user_params)
    @user_options = ["faculty", "lab staff"]

    if @user.save
      redirect_to root_path
    else
      # @errors = @user.errors.full_messages
      render "new"
    end
  end

  def show
    user = User.find(session[:user_id])
    puts "$$$$$$$$$$$$$$$$$$$$$$"
    @proposals = user.proposals.all
    @experiments = user.experiments.all
    @comments = Comment.all
  end


  private
    def user_params
      params.require(:user).permit(:user_type, :name, :email, :password)
    end
end
