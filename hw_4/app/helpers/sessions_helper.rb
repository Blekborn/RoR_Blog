module SessionsHelper

  def log_in(author)
    session[:author_id] = author.id
  end

  def remember(author)
    author.remember
    cookies.permanent.signed[:user_id] = author.id
    cookies.permanent[:remember_token] = author.remember_token
  end

  def current_user?(author)
    author == current_user
  end

  def current_user
    if (author_id = session[:author_id])
      @current_user ||= Author.find_by(id: author_id)
    elsif (author_id = cookies.signed[:author_id])
      author = Author.find_by(id: author_id)
      if author&.authenticated?(cookies[:remember_token])
        log_in author
        @current_user = author
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def forget(author)
    author.forget
    cookies.delete(:author_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    session.delete(:author_id)
    @current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
