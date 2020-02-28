class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new,:create,:edit,:update,:destroy]
  before_action :correct_user, only: [:update,:destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    category_list = params[:category_list].split(",")
    if @post.save
      @post.save_categories(category_list)
      flash[:notice] = "スレッドの投稿が完了しました！"
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @category_list = @post.categories.pluck(:name).join(",")
  end

  def update
    @post = Post.find(params[:id])
    category_list = params[:category_list].split(",")
    if @post.update_attributes(post_params)
      @post.save_categories(category_list)
      remove_not_used_cat
      flash[:notice] = "スレッドの編集が完了しました！"
      @posts = current_user.posts
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def show

    @post = Post.find(params[:id])
    @reply = Reply.new

    save_new_history(@post)

    remove_extra_history_stock

  end

  def destroy
    Post.find(params[:id]).destroy
    remove_not_used_cat
    flash[:notice] = "スレッドを削除しました！"
    redirect_to current_user
  end

  private

    def post_params
      params.require(:post).permit(:title)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
