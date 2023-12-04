module ApplicationHelper
  def current_user
    # Saving info to an instance variable so when current_user is called
    # 3 times in the _header, it doesn't have to make 3 queries.
    # Instead, it will be cached in @current_user, and returned.
    # The ||= operator runs the code on the right if @current_user doesn't have
    # a value. Effectively, we run it once and return @current_user for
    # subsequent calls.
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
