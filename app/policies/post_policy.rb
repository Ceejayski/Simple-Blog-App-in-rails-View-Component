class PostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    user_member?
  end

  def show?
    user_member?
  end

  def create?
    record.author == user or record.group.creator == user
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
