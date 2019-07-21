class CategoriesController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = 'カテゴリを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'カテゴリの登録に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
