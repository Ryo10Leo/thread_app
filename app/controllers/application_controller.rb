class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
  include SessionsHelper
  include PostsHelper

  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = "サービスをご利用になるにはログインが必要です。"
        redirect_to login_url
      end
    end
end
