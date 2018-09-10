class Item < ApplicationRecord
  before_save { self.name = name.downcase }
  validates :name,  presence: true, uniqueness: { case_sensitive: false }
  validates :picture, presence: true
  validates :per_cost, presence: true, numericality: { only_integer: true },
            numericality: { greater_than: 99 }
  validates :description, presence: true
  validates :stock_number, presence: true, numericality: { only_integer: true },
            numericality: { greater_than: 0 }
end
