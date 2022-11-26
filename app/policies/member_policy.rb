class MemberPolicy < ApplicationPolicy
  def create?
    user != record.creator && !record.members.exists?(user.id)
  end

  def destroy?
    user != record.creator && record.members.exists?(user.id) || user == record.creator
  end
end
