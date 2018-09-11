class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :picture
      t.integer :per_cost
      t.text :description
      t.integer :stock_number

      t.timestamps
    end
  end
end
