class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id         , null: false, foreign_key: true
      t.binary :image            , null: false
      t.string :name             , null: false
      t.string :text             , null: false
      t.integer :categoly        , null: false
      t.integer :item_status     , null: false
      t.integer :charge          , null: false
      t.integer :location        , null: false
      t.integer :shipping        , null: false
      t.integer :price           , null: false
      t.timestamps
    end
  end
end
