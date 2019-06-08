class ApplicationController < ActionController::Base

  helper_method :current_user, :is_loggedin?, :require_user

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end

  end

  def is_loggedin?

    !!current_user


  end

  def require_user

    if is_loggedin?

    else
      redirect_to login_path

    end

  end

end
