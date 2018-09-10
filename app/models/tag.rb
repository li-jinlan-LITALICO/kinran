class Tag < ApplicationRecord
  before_save { self.name = name.downcase }
  validates :name,  presence: true, uniqueness: { case_sensitive: false },
            length: { minimum: 1 }
end
