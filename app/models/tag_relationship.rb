class TagRelationship < ApplicationRecord
  belongs_to :relative_item, class_name: "Item"
  belongs_to :relative_tag, class_name: "Tag"
  validates :relative_item_id, presence: true
  validates :relative_tag_id, presence: true
end
