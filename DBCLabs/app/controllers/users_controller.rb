class UsersController < ApplicationController
  def new
    @user_options = ["faculty", "lab staff"]
  end

  def create
    @user = User.new(user_params)
    @user_options = ["faculty", "lab staff"]

    if @user.save
      session[:user_id] = @user.id
      redirect_to experiments_path
    else
      # @errors = @user.errors.full_messages
      render "new"
    end
  end


  private
    def user_params
      params.require(:user).permit(:user_type, :name, :email, :password)
    end
end
