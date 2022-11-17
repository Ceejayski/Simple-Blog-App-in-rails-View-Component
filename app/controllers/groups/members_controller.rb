class Groups::MembersController < ApplicationController
  before_action :set_group

  def create
    @group.members << current_user
    redirect_to @group
  end

  def destroy
    @group.members.destroy(current_user)
    redirect_to root_path
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end
end
