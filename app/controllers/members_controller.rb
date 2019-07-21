class MembersController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      current_user.groups.first.users << @user
      # @user.groups << current_user.groups.first
      flash[:success] = 'ユーザの追加に成功しました。'
      redirect_to edit_user_path(current_user)
    else
      flash.now[:danger] = 'ユーザの追加に失敗しました。'
      render :new
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
