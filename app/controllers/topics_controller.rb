class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
  end

  def show
  end

  def create
    @topic = Topic.create(topic_params)
  end

  def destroy
  end

  protected

  def topic_params
    params.require(:topic).permit(:title)
  end

end
