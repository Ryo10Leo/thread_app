class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :correct_user, only: [:show]


  def new
    redirect_to root_path if current_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:notice] = "ユーザー登録が完了しました！"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 30)
  end


  private

      def user_params
        params.require(:user).permit(:user_id, :email, :password,
                                    :password_confirmation)
      end

      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
      end
end