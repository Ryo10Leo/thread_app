class ReplyUser < ApplicationRecord
    belongs_to :reply
    belongs_to :user
    validates :reply_id,presence:true
    validates :user_id,presence:true
end
