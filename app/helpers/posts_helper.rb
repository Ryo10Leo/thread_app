module PostsHelper

        #記事で使わなくなったカテゴリーを全て削除
        def remove_not_used_cat

            not_used_cats = Category.not_used_cats

            not_used_cats.destroy_all if not_used_cats
        end

        #リプを投稿したユーザーID
        def user_id(reply)
            reply.user.user_id
        end

        #スレッドを立てたユーザーIDを赤色にする
        def color(reply)
            "red" if reply.user == reply.post.user
        end

        #リプライフォームに名前の入力がなければ、'名無しさん'に設定
        def user_name(reply)
            if reply.name == ''
                "名無しさん"
            else
                reply.name
            end
        end

        # >>○○にリンク付
        def add_anchor_to_(content)
            if anchors = content.scan(/>>[0-9]+/)
                anchors.each do |anchor,i|
                    number = anchor.match(/[0-9]+/)
                    text = "<a href=#{@post.id}#reply-#{number}>#{anchor}</a>"
                    content.sub!(/#{anchor}/,text)
                end
            end
            simple_format(content)
        end

        #ユーザーの閲覧履歴を更新
        def save_new_history(post)

            new_history = current_user.browsing_histories.build(post_id: post.id)

            if current_user.browsing_histories.exists?(post_id: "#{params[:id]}")
                old_history = current_user.browsing_histories.find_by(post_id: "#{params[:id]}")
                old_history.destroy
            end

            new_history.save
        end

        #閲覧履歴が5件を越えたら一番古いデータを削除
        def remove_extra_history_stock

            histories_stock_limit = 5
            histories = current_user.browsing_histories.all

            if histories.count > histories_stock_limit
            histories[0].destroy
            end
        end
end
