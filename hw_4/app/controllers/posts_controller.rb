class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :logged_in_author, only: %i[create destroy]
  before_action :correct_user, only: :destroy
  before_action :add_view, only: %i[index show]


  def index
    @post = current_user.posts.build if logged_in?
    @posts = if params[:search]
               Post.search(params[:search]).order('created_at DESC').paginate(page: params[:page], per_page: 8)
             else
               Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 8)
             end
  end

  def show
    @comments = @post.comments

    # @comment_status = params[:comments_status].to_s.downcase
    #
    ## @comments = if @comment_status == 'unpublished'
    #               @post.comments.unpublished
    ##             else
    #               @post.comments.published
    ##             end

    # @post.increment(:views)
    # @post.save
    @post.increment!(:views)
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search; end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :photo, :author_id)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end

  def add_view
    unless current_user
      cookies[:views] = cookies[:views].present? ? cookies[:views].to_i + 1 : 1
      @pls_register = cookies[:views].to_i % 5 == 0
    end
  end
end
