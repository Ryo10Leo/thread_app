class Category < ApplicationRecord

    has_many :post_categories, dependent: :destroy
    has_many :posts, through: :post_categories
    validates :name,presence:true,length:{maximum:50}

    #カテゴリモデルから使われていないカテゴリ抽出
    def Category.not_used_cats
        categories = Category.arel_table
        post_categories = PostCategory.arel_table

        #スレッドから使われているカテゴリを抽出
        conditon =
            post_categories
                .project(post_categories[:category_id])
                .where(categories[:id].eq(post_categories[:category_id]))

        #使われていないカテゴリを削除
        Category.where(conditon.exists.not).all
    end
end
