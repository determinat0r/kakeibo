class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update]
  before_action :correct_user, only: [:index, :show, :edit, :update]
  
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

    if user_params[groups_attributes: [:name]].blank? || user_params[groups_attributes: [:name]].length > 50
      flash.now[:danger] = '世帯名称は必須です。50字以内で入力してください。'
      render :new
    elsif @user.save
      # group情報を紐付ける
      join_group
      create_default_categories
      @user.groups.first.build_month(open_day: Date.current.beginning_of_month).save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if user_params[:password].blank?
      flash.now[:danger] = 'パスワードが空欄です。'
      render :edit
    elsif @user.update(user_params)
      flash[:success] = 'パスワードは正常に更新されました'
      redirect_to edit_user_path(current_user)
    else
      flash.now[:danger] = 'パスワードは更新されませんでした'
      render :edit
    end
  end

  private

  def join_group
    if params[:group_name].present?
      if group = Group.find_or_create_by(name: params[:group_name])
        @user.groups << group
      end
    end
  end
  
  def create_default_categories
    @user.groups.first.categories.create(name: "食費")
    @user.groups.first.categories.create(name: "医薬品")
    @user.groups.first.categories.create(name: "消耗品")
    @user.groups.first.categories.create(name: "衣服")
    @user.groups.first.categories.create(name: "生活雑貨")
    @user.groups.first.categories.create(name: "外食")
    @user.groups.first.categories.create(name: "旅行")
    @user.groups.first.categories.create(name: "レジャー")
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,  groups_attributes: [:name])
  end

  private

  def correct_user
    @user = current_user
    if @user.id.to_s != params[:id]
      redirect_to root_url
    end
  end
end
