class GroupsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:success] = '世帯を登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = '世帯の登録に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
