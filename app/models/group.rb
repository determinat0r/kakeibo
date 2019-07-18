class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  
  has_many :users_groups_relationships
  has_many :users, through: :users_groups_relationships, source: :user
end
