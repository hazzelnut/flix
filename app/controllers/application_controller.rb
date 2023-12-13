class ApplicationController < ActionController::Base

  private

  def current_user
    # Saving info to an instance variable so when current_user is called
    # 3 times in the _header, it doesn't have to make 3 queries.
    # Instead, it will be cached in @current_user, and returned.
    # The ||= operator runs the code on the right if @current_user doesn't have
    # a value. Effectively, we run it once and return @current_user for
    # subsequent calls.
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

  def current_user_admin?
    current_user && current_user.admin?
  end

  helper_method :current_user_admin?

  def require_admin
    unless current_user_admin?
      redirect_to root_url, alert: 'Unauthorized access!'
    end
  end

  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_session_url, alert: 'Please sign in first!'
    end
  end
end
