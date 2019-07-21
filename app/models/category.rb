class Category < ApplicationRecord
  belongs_to :group
  
  validates :name, presence: true, length: { maximum: 255 }
  
  has_many :expenses
end
