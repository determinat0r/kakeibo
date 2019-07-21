class Expense < ApplicationRecord
  belongs_to :input_user, class_name: 'User'
  belongs_to :pay_for_user, class_name: 'User', optional: true
  belongs_to :pay_for_group, class_name: 'Group', optional: true
  belongs_to :pay_user, class_name: 'User', optional: true
  belongs_to :pay_group, class_name: 'Group', optional: true
  belongs_to :category
  
  validates :type, presence: true
  validates :day, presence: true
  validates :money, presence: true
  validates :category, presence: true
  
  after_initialize :set_initial, if: :new_record?
  
  def set_initial
    self.pay_for_user_id = User.current.id
    self.pay_for_group_id = User.current.groups.first.id
  end
  
  
end
