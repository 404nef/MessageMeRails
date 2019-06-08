class SessionsController < ApplicationController

  before_action :checkifloggedin, only: [:root]

  def root

    @msg = Message.new

  end

  def validate

    @user = User.find_by(username: params[:session][:username])

    if(@user && @user.authenticate(params[:session][:password]))
      flash[:success]="Welcome #{@user.username}"
      session[:user_id]=@user.id
      redirect_to root_path

    else

      flash.now[:negative]="Incorrect Username or Password"

      render "users/login"

    end

  end

  def logout
    session[:user_id]=nil
    redirect_to login_path
  end

  private
  def checkifloggedin
    if !is_loggedin?
      redirect_to login_path
    end
  end

end
