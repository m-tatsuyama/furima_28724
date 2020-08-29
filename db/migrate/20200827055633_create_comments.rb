class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id    , null: false, foreign_key: true
      t.integer :item_id    , null: false, foreign_key: true
      t.string :content
      t.timestamps
    end
  end
end
