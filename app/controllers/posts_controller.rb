class PostsController < ApplicationController
  def new
    @post = Post.new
    @topic = Topic.find(params[:tpc_id])
    @post.topic_id = @topic.id
  end

  def show
    @post = Post.find(params[:pst_id])
  end

  def create
    @post = Post.new(post_params)
    @topic = Topic.find(params[:tpc_id])
    @post.topic_id = @topic.id
    @post.user_id = current_user.id
    if @post.save
      redirect_to topic_show_path(@post.topic_id)
    else
      render 'new'
    end
  end

  def delete
    @post = Post.find(params[:pst_id])
    @post.delete
    redirect_to topic_show_path(params[:tpc_id])
  end


  protected

    def post_params
      params.require(:post).permit(:topic_id , :name , :content)
    end

end
