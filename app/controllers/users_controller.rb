class UsersController < ApplicationController

  before_action :checklogged , only: [:login, :new]

  def login

  end

  def new

    @user = User.new
  end

  def create

    @user = User.create(user_params)

    if @user.save
      flash[:sucess]="Welcome #{@user.username}"

      session[:user_id]=@user.id

      redirect_to root_path

    else

      render "new"

    end
  end

  private
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end

  def checklogged
    if is_loggedin?
      redirect_to root_path
    end
  end

end
