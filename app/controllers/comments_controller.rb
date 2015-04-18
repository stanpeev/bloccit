class CommentsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to @post 
    else
      flash[:error] = "Error creating comment. Please try again."
      render "posts/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
