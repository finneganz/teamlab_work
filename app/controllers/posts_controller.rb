class PostsController < ApplicationController
  def new
    @post = Post.new
    @topic = Topic.find(params[:id])
    @post.topic_id = @topic.id
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @topic = Topic.find(params[:id])
    @post.topic_id = @topic.id
    @post.user_id = current_user.id
    if @post.save
      redirect_to topic_show_path(@post.topic_id)
    else
      render 'new'
    end
  end

  def destroy
  end


  protected

    def post_params
      params.require(:post).permit(:topic_id , :name , :content)
    end

end
