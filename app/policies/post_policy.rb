class PostPolicy < ApplicationPolicy
  def show?
    user_member? or record.group.creator == user
  end

  def create?
    user_member? or record.group.creator == user
  end

  def update?
    record.author == user or record.group.creator == user
  end

  def destroy?
    record.author == user or record.group.creator == user
  end

  private

  def user_member?
    record.group.members.exists?(user.id)
  end
end
