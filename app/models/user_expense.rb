class UserExpense < Expense
  
  belongs_to :pay_for_user, class_name: 'User'
  
end