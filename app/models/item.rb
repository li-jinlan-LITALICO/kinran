class Item < ApplicationRecord
  # has_many :order_items
  has_many :tag_relationships, foreign_key: "relative_item_id",
                                dependent:  :destroy
  has_many :relative_tags, through: :tag_relationships
  has_many :cart_items, dependent: :destroy
  validates :name,  presence: true, uniqueness: { case_sensitive: false }
  validates :picture, presence: true
  validates :per_cost, presence: true, numericality: { greater_than: 99 }
  validates :description, presence: true
  validates :stock_number, presence: true, numericality: { greater_than: 0 }


  #商品をタグ付ける
  def follow(tag)
    relative_tags << tag
  end

  #商品をタグ付けない
  def unfollow(tag)
    tag_relationships.find_by(relative_tag_id: tag.id).destroy
  end

  #商品にタグ付けされていたらtrueを返す
  def following?(tag)
    relative_tags.include?(tag)
  end
end
