class PostsController < ApplicationController
  before_action :set_post, only: [:edit,:update,:delete]

  def new
    @post = Post.new
    @topic = Topic.find(params[:tpc_id])
    @post.topic_id = @topic.id
  end

  def edit
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
    @post.delete
    redirect_to topic_show_path(params[:tpc_id])
  end

  def update
    if @post.update(post_params)
      redirect_to topic_show_path(@post.topic_id)
    else
      render 'edit'
    end
  end


  protected

    def post_params
      params.require(:post).permit(:topic_id , :name , :content)
    end

    def set_post
      @post = Post.find(params[:pst_id])
    end

end
