# frozen_string_literal: true

class GroupMemberComponent < ViewComponent::Base
  with_collection_parameter :member
  def initialize(member:, group:, current_user:)
    @member = member
    @group = group
    @current_user = current_user
  end

  def remove_user_button
    return unless @current_user == @group.creator

    link_to group_members_path(@group, user_id: @member.id),
            data: { confirm: 'Are you sure?', turbo_method: :delete }, class: 'inline' do
      content_tag :i, nil, class: 'fas fa-times text-red-600'
    end
  end
end
