class ChangeDataPostIdAndUserIdToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :browsing_histories, :user_id, 'integer USING CAST(user_id AS integer)'
    change_column :browsing_histories, :post_id, 'integer USING CAST(post_id AS integer)'
  end
end
