class UsersController < ApplicationController
  
  #ユーザに関するページはないので、要修正
  
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.order(id: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # group情報を紐付ける
      join_group
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def join_group
    if params[:group_name].present?
      if group = Group.find_or_create_by(name: params[:group_name])
        @user.groups << group
      end
    end
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,  groups_attributes: [:name])
  end
end
