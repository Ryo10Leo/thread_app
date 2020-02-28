class CreateBrowsingHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :browsing_histories do |t|

      t.timestamps
    end
  end
end
