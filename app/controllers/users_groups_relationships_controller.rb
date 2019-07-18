class UsersGroupsRelationshipsController < ApplicationController
  def create
    group = Group.find(params[:group_id])
    current_user.join(group)
    flash[:success] = 'ユーザの世帯登録が完了しました。'
    redirect_to user
  end

  def destroy
  end
end
