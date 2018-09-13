class Tag < ApplicationRecord
  has_many :tag_relationships, foreign_key: "relative_tag_id",
                                dependent:  :destroy
  has_many :relative_items, through: :tag_relationships
  validates :name,  presence: true, uniqueness: { case_sensitive: false },
            length: { minimum: 1 }

  #タグに商品が含まれていたらtrueを返す
  def followed_by?(item)
    relative_items.include?(item)
  end

end
