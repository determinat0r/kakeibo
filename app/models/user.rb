class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :users_groups_relationships
  has_many :groups, through: :users_groups_relationships, source: :group
  
  def join(group)
    self.groups.find_or_create_by(group_id: group.id)
  end
  
  # after_save :confirmation_email_send
  
  # def join_group(group)
  #   groups << group
  # end
end
