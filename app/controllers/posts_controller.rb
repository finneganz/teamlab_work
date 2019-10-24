class PostsController < ApplicationController
  def new
    @post = Post.new
    @post.topic_id = params[:id]
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
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
