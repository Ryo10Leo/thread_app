class User < ApplicationRecord
    has_secure_password
    validates :user_id,presence: true

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email,presence: true,length:{ maximum: 255 },
                format:{ with: VALID_EMAIL_REGEX },
                uniqueness: { case_sensitive: false }

    validates :password,presence: true,length: { minimum: 6 },allow_nil:true
end
