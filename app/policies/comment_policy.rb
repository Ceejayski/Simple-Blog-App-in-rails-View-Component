class CommentPolicy < ApplicationPolicy
  def create?
    user_member? || record.post.author == user || record.post.group.creator == user
  end

  def update?
    record.post.group.creator == user or record.user == user
  end

  def destroy?
    record.post.group.creator == user or record.user == user
  end

  private

  def user_member?
    record.post.group.members.exists?(user.id)
  end
end
