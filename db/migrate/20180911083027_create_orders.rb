class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :shipped_user_name
      t.string :shipped_postal_code
      t.string :shipped_address
      t.string :shipped_phone_number
      t.integer :billing_amount
      t.string :ordered_digest
      t.datetime :ordered_at
      t.references :user, foreign_key: true, presence: true

      t.timestamps
    end
    add_index :orders, [:user_id, :ordered_at]
  end
end
