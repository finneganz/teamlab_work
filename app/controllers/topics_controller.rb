class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @posts = Post.all
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = Post.where(topic_id: params[:id])
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
  end

  protected

  def topic_params
    params.require(:topic).permit(:title)
  end

end
