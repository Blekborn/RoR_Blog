class CommentsController < ApplicationController
  before_action :set_comment, only: %i[new edit show create update destroy]
  before_action :logged_in_author, only: %i[create destroy]

  def index
    @post.comments = @post.comments.arrange(order: :created_at)
  end

  def show
    @comment = @post.comments.find(params[:id])
  end

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.author_id = current_user.id
    if @comment.ancestors.count <= 4
      if @comment.save
        redirect_to @post
      else
        redirect_to @post
        flash[:danger] = 'Comment is too long (maximum is 300 characters)'
      end
    else
      redirect_to @post, alert: 'To much comments in one tree (5 comments max)'
    end
  end

  def update
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: 'successfully updated.'
    else
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def publish
    @comment = @post.comments.find(params[:id])
    @comment.update(status: :published)
    redirect_to post_path(@post), notice: 'successfully published.'
  end

  def upvote
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.liked_by current_user
    redirect_to post_path(@post)
  end

  def downvote
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.downvote_from current_user
    redirect_to post_path(@post)
  end

  private

  def set_comment
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :author_id, :post_id, :parent_id)
  end

end
