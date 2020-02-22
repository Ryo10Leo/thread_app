module PostsHelper

        #記事で使わなくなったカテゴリーを全て削除
        def remove_not_used_cat

            not_used_cats = Category.not_used_cats

            not_used_cats.destroy_all if not_used_cats
        end

        def user_id(reply)
            reply.user.user_id
        end

        def color(reply)
            "red" if reply.user == reply.post.user
        end

        def user_name(reply)
            if reply.name == ''
                "名無しさん"
            else
                reply.name
            end
        end
end
