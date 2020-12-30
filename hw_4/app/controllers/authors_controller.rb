class AuthorsController < ApplicationController

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
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @author
    else
      render 'new'
    end
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :gender, :email, :password, :password_confirmation)
  end

end