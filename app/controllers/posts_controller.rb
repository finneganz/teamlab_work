class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.topic_id = 
    if @topic.save
      redirect_to topic_show_path(@topic.id)
    else
      render 'new'
    end
  end

  def destroy
  end


  protected

    def post_params
      params.require(:post).permit(:name , :content)
    end

end
