class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "スレッドの投稿が完了しました！"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end


  private

    def post_params
      params.require(:post).permit(:title)
    end

end
