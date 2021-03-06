class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    @topic = @post.topic
    @new_comment = Comment.new 

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was deleted successfully."
    else
      flash[:error] = "There was an error deleting the comment. Please try again."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end