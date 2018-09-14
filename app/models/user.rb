class User < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :add_cart_items, through: :cart_items, source: :item
  has_many :orders
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :postal_code, presence: true, numericality: { only_integer: true },
                          length: { is: 7 }
  validates :address, presence: true, length: { minimum: 8 }
  validates :phone_number, presence: true, numericality: { only_integer: true },
                          length: { minimum: 9 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def add_cart_item(item, cart_item_number)
    cart_items.create!(cart_item_number: cart_item_number, user_id: self.id, item_id: item.id)
  end

  def destroy_cart_item(item)
    cart_items.find_by(item_id: item.id).destroy!
  end

  def add_cart_item?(item)
    add_cart_items.include?(item)
  end

end
