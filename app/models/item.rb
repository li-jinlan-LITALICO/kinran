class Item < ApplicationRecord
  # has_many :cart_items dependent: :destroy
  # has_many :order_items
  has_many :tag_relationships, foreign_key: "relative_item_id",
                                dependent:  :destroy
  has_many :following, through: :tag_relationships, source: :relative_tag
  validates :name,  presence: true, uniqueness: { case_sensitive: false }
  validates :picture, presence: true
  validates :per_cost, presence: true, numericality: { greater_than: 99 }
  validates :description, presence: true
  validates :stock_number, presence: true, numericality: { greater_than: 0 }


  #商品をタグ付ける
  def follow(tag)
    following << tag
  end

  #商品をタグ付けない
  def unfollow(tag)
    tag_relationships.find_by(relative_tag_id: tag.id).destroy
  end

  #商品にタグ付けされていたらtrueを返す
  def following?(tag)
    following.include?(tag)
  end
end
