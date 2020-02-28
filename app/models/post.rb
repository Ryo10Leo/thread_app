class Post < ApplicationRecord

    #スレッド投稿したユーザー
    belongs_to :user

    #スレッドのカテゴリ
    has_many :post_categories, dependent: :destroy
    has_many :categories, through: :post_categories

    #スレッドのレス
    has_many :replies, dependent: :destroy

    #スレッド閲覧履歴
    has_many :browsing_histories, dependent: :destroy

    #投稿順
    default_scope -> { order(created_at: :desc) }

    #カテゴリに該当するスレッドを取得
    scope :from_category, -> (category_id)  { where(id: posts_ids = PostCategory.where(category_id: category_id).select(:post_id))}

    validates :title,presence: true
    validates :user_id, presence: true

    #スレッドの検索
    def self.search(search)
      if search
        Post.where(id: Reply.where(['content LIKE ?', "%#{search}%"]).select(:post_id) )
            .or(Post.where(['title LIKE ?', "%#{search}%"]))
      else
        Post.all
      end
    end

    #スレッドのカテゴリを保存
    def save_categories(tags)
        current_tags = self.categories.pluck(:name) unless self.categories.nil?
        old_tags = current_tags - tags
        new_tags = tags - current_tags

        #スレッドで使われていないタグの削除
        old_tags.each do |old_name|
          self.categories.delete Category.find_by(name:old_name)
        end

        #スレッドのタグを更新
        new_tags.each do |new_name|
          post_category = Category.find_or_create_by(name:new_name)
          self.categories << post_category
        end
      end

end
