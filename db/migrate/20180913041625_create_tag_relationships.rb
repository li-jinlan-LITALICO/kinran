class CreateTagRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_relationships do |t|
      t.integer :relative_item_id
      t.integer :relative_tag_id

      t.timestamps
    end
    add_index :tag_relationships, :relative_item_id
    add_index :tag_relationships, :relative_tag_id
    add_index :tag_relationships, [:relative_item_id, :relative_tag_id], unique: true 
  end
end
