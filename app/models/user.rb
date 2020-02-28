class User < ApplicationRecord
    attr_accessor :remember_token

    before_save :downcase_email

    has_secure_password
    validates :user_id,presence: true

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email,presence: true,length:{ maximum: 255 },
                format:{ with: VALID_EMAIL_REGEX },
                uniqueness: { case_sensitive: false }

    validates :password,presence: true,length: { minimum: 6 },allow_nil:true


    #ユーザーが投稿したレス
    has_many :reply_users, dependent: :destroy
    has_one :replies, through: :reply_users

    #ユーザーが投稿したスレッド
    has_many :posts, dependent: :destroy

    #ユーザーが閲覧したスレッド
    has_many :browsing_histories, dependent: :destroy
    has_many :browsing_posts, through: :browsing_histories, source: :post

    #ダイジェストの作成
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    #ランダムなトークンを返す
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    # 永続セッションのためにユーザーをデータベースに記憶する
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest,User.digest(remember_token))
    end

    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    #ユーザーが保持するRemember_digestを削除
    def forget
        update_attribute(:remember_digest, nil)
    end

    private

    #メールアドレスの小文字化
    def downcase_email
        self.email.downcase!
    end

end
