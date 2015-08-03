class UsersController < ApplicationController
  def new
    @user_options = ["faculty", "lab staff"]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render "new"
    end
  end


  private
    def user_params
      params.require(:user).permit(:user_type, :name, :email, :password)
    end
end
