class TopicsController < ApplicationController
  before_action :set_topic, only: [:show,:edit,:update,:destroy]

  def index
    @topics = Topic.all
    @posts = Post.all
  end

  def new
    @topic = Topic.new
  end

  def show
    @posts = @topic.posts
  end 

  def edit
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
    @topic.destroy
    redirect_to root_path
  end

  protected

  def topic_params
    params.require(:topic).permit(:title)
  end

  def set_topic
    @topic = Topic.find(params[:tpc_id])
  end

end
