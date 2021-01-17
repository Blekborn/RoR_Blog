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
      respond_to do |format|
        if @comment.save
          format.js { render 'create', status: :created, location: @post }
          format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        else
          format.html { redirect_to @post, alert: @comment.errors.full_messages.first }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @post, alert: 'To much comments in one tree (5 comments max)' }
      end
    end
  end

  def update
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.js { render 'update', status: :created, location: @post }
        format.html { redirect_to @post, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js { render 'destroy', status: :created, location: @post }
      format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
    end
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
    respond_to do |format|
      format.js { render 'vote', status: :created, location: @post }
      format.html { redirect_to @post }
    end
  end

  def downvote
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.downvote_from current_user
    respond_to do |format|
      format.js { render 'vote', status: :created, location: @post }
      format.html { redirect_to @post }
    end
  end

  private

  def set_comment
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :author_id, :post_id, :parent_id)
  end

end
