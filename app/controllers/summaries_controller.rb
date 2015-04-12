class SummariesController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    if post.summary
      flash[:error] = "A Summary for this post already exists."
      redirect_to action: 'show'
    end
      
    @summary = @post.build_summary
    authorize @summary
  end

  def create
    @post = Post.find(params[:post_id])
    @summary = @post.build_summary(params.require(:summary).permit(:body))

    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to [@post, @summary]
    else
      flash[:error] = "There was an error saving the summary. Please try again."
      render :new
    end
  end

  def show
    @post = Post.find(params[:post_id])
    @summary = @post.summary

    authorize @summary
  end
end
