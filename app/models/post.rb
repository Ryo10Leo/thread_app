class Post < ApplicationRecord

    belongs_to :user
    has_many :post_categories, dependent: :destroy
    has_many :categories, through: :post_categories
    has_many :replies, dependent: :destroy


    default_scope -> { order(created_at: :desc) }
    validates :title,presence: true
    validates :user_id, presence: true

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
