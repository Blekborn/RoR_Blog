class SessionsController < ApplicationController
  def new; end

  def create
    author = Author.find_by(email: params[:session][:email].downcase)
    if author&.authenticate(params[:session][:password])
      log_in author
      params[:session][:remember_me] == '1' ? remember(author) : forget(author)
      redirect_to author
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
    # author = Author.find_by_email(params[:email])
    # if author&.authenticate(params[:password])
    #   session[:author_id] = author.id
    #   redirect_to root_path, notice: 'Logged in!'
    # else
    #   flash.now.alert = 'Email or password is invalid'
    #   render 'new'
    # end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
    # session[:author_id] = nil
    # redirect_to root_path, notice: 'Logged out!'
  end
end
