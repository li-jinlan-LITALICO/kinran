class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
    #インデックス自体は一意性を強制しませんが、オプションでunique: trueを指定することで強制できるようになります。
    add_index :users, :email, unique: true
  end
end
