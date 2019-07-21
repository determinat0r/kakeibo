class UserExpense < Expense
  
  validates :pay_for_user, presence: true
  
end