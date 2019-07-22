class Month < ApplicationRecord
  belongs_to :group
  
  validates :open_day, presence: true
end
