class CommentsController < ApplicationController
  before_action :set_comment, only: %i[new edit create update destroy]
  before_action :logged_in_author, only: %i[create destroy]

  def new
    #@comment = Comment.new(author_id: params[:author_id])
  end

  def edit; end

  def create
    @comment = @post.comments.create(comment_params)
    # redirect_to post_path(@post)
    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
      flash[:danger] = 'Comment is too long (maximum is 300 characters)'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def update
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: 'successfully updated.'
    else
      redirect_to post_path(@post)
    end
  end

  def publish
    @comment = @post.comments.find(params[:id])
    @comment.update(status: :published)
    redirect_to post_path(@post), notice: 'successfully published.'
  end

  private

  def set_comment
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :author_id, :post_id)
  end

end
