class AuthorsController < ApplicationController
  before_action :logged_in_author, only: %i[index edit update]
  before_action :correct_author, only: %i[edit update]

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      log_in @author
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to @author
    else
      render 'new'
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      flash[:success] = 'Profile updated'
      redirect_to @author
    else
      render 'edit'
    end
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def logged_in_author
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  def correct_author
    @author = Author.find(params[:id])
    redirect_to(root_url) unless current_user?(@author)
  end
end