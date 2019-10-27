class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @posts = Post.all
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:tpc_id])
    @posts = @topic.posts
  end 

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topic_show_path(@topic.id)
    else
      render 'new'
    end
  end

  def destroy
    @topic = Topic.find(params[:tpc_id])
    @topic.destroy
    redirect_to root_path
  end

  protected

  def topic_params
    params.require(:topic).permit(:title)
  end

end
