class GroupExpense < Expense
  
  validates :pay_for_group, presence: true
  
end