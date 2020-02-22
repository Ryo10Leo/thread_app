module RepliesHelper

    def get_post_for_reply
        posted_user = User.find_by(id: params[:user_id])
        post = posted_user.posts.find_by(id: params[:post_id])
    end
end
