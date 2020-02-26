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
end
