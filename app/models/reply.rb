class Reply < ApplicationRecord
  has_one :reply_user, dependent: :destroy
  has_one :user, through: :reply_user
  belongs_to :post

  validates :content,presence: true
end
