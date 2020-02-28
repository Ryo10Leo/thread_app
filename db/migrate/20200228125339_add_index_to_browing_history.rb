class AddIndexToBrowingHistory < ActiveRecord::Migration[5.1]
  def change
    add_index :browsing_histories, :user_id
    add_index :browsing_histories, :post_id
    add_index :browsing_histories, [:user_id,:post_id],unique: true
  end
end
