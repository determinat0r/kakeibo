class GroupExpense < Expense
  
  belongs_to :pay_for_group, class_name: 'Group'
  
end