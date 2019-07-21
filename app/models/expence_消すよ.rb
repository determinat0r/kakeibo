class Expence < ApplicationRecord
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
end
