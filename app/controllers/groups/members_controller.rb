class Groups::MembersController < ApplicationController
  before_action :set_group

  def create
    authorize @group, policy_class: MemberPolicy
    @group.members << current_user
    redirect_to @group
  end

  def destroy
    authorize @group, policy_class: MemberPolicy
    user = params[:user_id] || current_user.id
    member = User.find(user)
    @group.members.destroy(member)
    redirect_to root_path
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end
end
