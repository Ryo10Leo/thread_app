class AddUserIdPostIdToBrowsingHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :browsing_histories, :user_id, :string
    add_column :browsing_histories, :post_id, :string
  end
end
