class Reply < ApplicationRecord
  has_one :reply_user, dependent: :destroy
  has_one :user, through: :reply_user
  belongs_to :post

  mount_uploader :picture, ReplyPictureUploader
end
