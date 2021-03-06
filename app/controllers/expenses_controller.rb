class ExpensesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :show]
  
  def new
    @expense = current_user.expenses.build
  end
  
  def create
    @expense = current_user.expenses.build(expense_params)
    if @expense.save
      flash[:success] = '家計簿の入力が成功しました'
      redirect_to new_expense_path
    else
      flash.now[:danger] = '家計簿の入力が失敗しました。'
      render :new
    end
  end

  def destroy
    @expense.destroy
    flash[:success] = '入力を削除しました。'
    redirect_back(fallback_location: root_path)
  end

  def show
      @expenses = current_user.expenses.order(id: :desc)
  end

  private

  def expense_params
    params.require(:expense).permit(:input_user, :type, :pay_for_user_id, :pay_for_group_id, :pay_user_flag, :pay_user_id, :pay_group_id, :day, :money, :category_id, :memo)
  end

  def correct_user
    if current_user.id.to_s != params[:id]
      redirect_to root_url
    end
  end
end
