class TopicsController < ApplicationController

  def index
     @topics = Topic.visible_to(current_user).paginate(page: params[:page], per_page: 10)
     authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
    authorize @topic
    @posts = @topic.posts.includes(:user).includes(:comments).paginate(page: params[:page], per_page: 10)
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: "Topic was saved."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    
    authorize @topic
    if @topic.destroy
      flash[:notice] = "\"#{@topic.name}\" was deleted."
      redirect_to topics_path
    else
      flash[:error] = "Error deleting topic. Please try again."
      render :show
    end
  end

  def update
    @topic = Topic.find(params[:id])  
    authorize @topic 
    if @topic.update_attributes(topic_params)
      flash[:notice] = "Post was updated."
      redirect_to @topic
    else
      flash[:error] = "Error updating topic. Please try again."
      render :edit
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end

   def set_page_info(count)
      if params[:page] == nil
        page = 1
      else
        page = params[:page].to_i
      end
      return {"page" => page, "perpage" => 10, "max_item" => count}
   end
end
