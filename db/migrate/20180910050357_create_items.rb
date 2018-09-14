class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name, presence: true
      t.string :picture
      t.integer :per_cost, presence: true
      t.text :description
      t.integer :stock_number

      t.timestamps
    end
  end
end
