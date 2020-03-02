class SessionsController < ApplicationController
  def new
    redirect_to root_path if current_user
  end

  def create
    auth = request.env["omniauth.auth"]
    if auth.present?
      user = User.find_or_create_from_auth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      flash[:notice] = 'ログインが完了しました！'
      redirect_to user
    else #既存パタン
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        flash[:notice] = 'ログインが完了しました！'
        redirect_to root_url
      else
        flash.now[:danger] = '有効なメールアドレス、またはパスワードではありません。'
        render 'new'
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
