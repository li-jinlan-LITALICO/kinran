class AddIndexToItemsName < ActiveRecord::Migration[5.1]
  def change
    #インデックス自体は一意性を強制しませんが、オプションでunique: trueを指定することで強制できるようになります。
    add_index :items, :name, unique: true
  end
end
