class GroupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.groups.merge!(scope.where(creator_id: user.id))
    end
  end

  def show?
    user_member? || record.creator == user
  end

  private

  def user_member?
    record.members.exists?(user.id)
  end
end
