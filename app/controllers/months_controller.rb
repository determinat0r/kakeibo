class MonthsController < ApplicationController
  before_action :require_user_logged_in
  
  def edit
    @month = Month.find(params[:id])
    @condition = {day_gteq: @month.open_day, day_lteq: @month.open_day.end_of_month}
    # @expenses = Expense.ransack(condition).result
    # SELECT  `expenses`.* FROM `expenses` WHERE (`expenses`.`type` = 'GroupExpense' AND `expenses`.`day` >= '2019-07-01' AND `expenses`.`day` <= '2019-07-31') GROUP BY `expenses`.`pay_for_user_id` LIMIT 11
  end

  def update
    @month = Month.find(params[:id])
    date = @month.open_day.next_month
    @month.update(open_day: date)
    redirect_to expense_path
  end
end
