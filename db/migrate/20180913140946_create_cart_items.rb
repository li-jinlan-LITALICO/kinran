class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.integer :cart_item_number
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
    add_index :cart_items, [:item_id, :created_at]
    add_index :cart_items, [:user_id, :item_id], unique: true
  end
end
