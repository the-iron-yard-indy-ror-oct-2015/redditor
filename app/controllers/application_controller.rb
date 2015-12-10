class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user_session, :current_user
  before_action :current_user, :load_new_link

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    unless @current_user
      flash[:danger] = "You need to be logged in to do that."
      session[:last_page] = request.url
      redirect_to new_user_session_path
    end
  end

  def require_no_user
    if @current_user
      flash[:warning] = "You're already logged in and good to go."
      redirect_to root_url
    end
  end

  def load_new_link
    @new_link = Link.new
  end

end
