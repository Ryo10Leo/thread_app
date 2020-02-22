class CreateReplyUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :reply_users do |t|

      t.integer :reply_id
      t.integer :user_id

      t.timestamps
    end
    add_index :reply_users, :reply_id
    add_index :reply_users, :user_id
    add_index :reply_users, [:reply_id,:user_id],unique: true
  end
end
