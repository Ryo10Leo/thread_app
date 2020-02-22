class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.string :name
      t.string :content
      t.references :post, foreign_key: true

      t.timestamps
    end
    add_index :replies, [:post_id, :created_at]
  end
end
