class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :status)
  end
end
