class Order < ApplicationRecord
  belongs_to :user
  # has_many :order_items dependent: :destroy
  validates :user_id, presence: true
  validates :shipped_user_name,  presence: true
  validates :shipped_postal_code,  presence: true
  validates :shipped_address,  presence: true
  validates :shipped_phone_number,  presence: true
  validates :billing_amount,  presence: true, numericality: { only_integer: true }
  validates :ordered_digest,  presence: true, uniqueness: { case_sensitive: false }
  validates :ordered_at,  presence: true
end
