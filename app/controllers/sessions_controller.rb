class SessionsController < ApplicationController
  before_action :find_user, except: [:new, :destroy]

  def new
  end

  def create
     @user = User.authenticate(params[:user])
    if @user
      session[:user_id]  = @user.id
      redirect_to experiments_path
    else
      @errors = "Your username/password combination is incorrect!"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def login_params
      params.require(:login).permit(:name, :password)
    end

    def find_user
      @user = User.find_by(name: params[:user][:name])
    end
end
