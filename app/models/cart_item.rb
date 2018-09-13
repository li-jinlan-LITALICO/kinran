class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :cart_item_number, presence: true, numericality: { greater_than: 0 }
end
