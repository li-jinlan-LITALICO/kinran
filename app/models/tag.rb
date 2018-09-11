class Tag < ApplicationRecord
  # has_many : tag_items dependent: :destroy
  validates :name,  presence: true, uniqueness: { case_sensitive: false },
            length: { minimum: 1 }
end
