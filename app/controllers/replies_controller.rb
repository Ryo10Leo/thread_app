class RepliesController < ApplicationController
    before_action :logged_in_user, only: [:create]
    before_action :correct_user, only: [:destroy]

    include RepliesHelper

    def create

        @post = get_post_for_reply
        @reply = @post.replies.build(reply_params)
        if @reply.save
            @reply_user = @reply.build_reply_user(user_id: current_user.id)
            if @reply_user.save
                @post.replies
            else
                render 'posts/show'
            end
        else
            render 'posts/show'
        end
    end

    def destroy
        @reply = Reply.find_by(id: params[:id])
        post = @reply.post
        @reply.destroy
        redirect_to post_path(post)
    end

private

    def reply_params
      params.require(:reply).permit(:name, :content)
    end

    def correct_user
      @reply = Reply.find_by(id: params[:id])
      redirect_to root_url if current_user?(@reply.user)
    end
end
