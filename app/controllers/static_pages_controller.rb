class StaticPagesController < ApplicationController

    def home
        @posts = Post.all
    end

    def about
        redirect_to root_path if current_user
    end
end
