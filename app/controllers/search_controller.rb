class SearchController < ApplicationController
    before_action :logged_in_user, only: [:index]


    def index
        if params[:category_id]
            @selected_category = Category.find(params[:category_id])
            @posts= Post.from_category(params[:category_id]).paginate(page: params[:page], per_page: 30)
          else
            @search_word = params[:search]
            @posts = Post.search(@search_word).paginate(page: params[:page], per_page: 30)
          end
    end
end
