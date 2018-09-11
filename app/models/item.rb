class Item < ApplicationRecord
  # has_many : tag_items　dependent: :destroy
  # has_many : cart_items　dependent: :destroy
  # has_many : order_items
  before_save { self.name = name.downcase }
  validates :name,  presence: true, uniqueness: { case_sensitive: false }
  validates :picture, presence: true
  validates :per_cost, presence: true, numericality: { greater_than: 99 }
  validates :description, presence: true
  validates :stock_number, presence: true, numericality: { greater_than: 0 }
end
