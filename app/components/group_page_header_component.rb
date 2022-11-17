# frozen_string_literal: true

class GroupPageHeaderComponent < ViewComponent::Base
  def initialize(group:, current_user:)
    @group = group
    @current_user = current_user
  end

  def edit_group_link
    links = []
    if @group.creator == @current_user
      links << (link_to 'Edit', edit_group_path(@group), data: { turbo_frame: 'modal' },
                                                         class: 'inline-block text-gray-500 hover:text-gray-600 hover:bg-gray-50 rounded-t-lg p-4 text-sm font-medium text-center')
    end
    if @group.members.include?(@current_user)
      links << (link_to 'Leave', group_members_path(@group),
                        class: 'inline-block text-gray-500 hover:text-gray-600 hover:bg-gray-50 rounded-t-lg p-4 text-sm font-medium text-center', data: { turbo_method: :delete })
    end

    links << (link_to 'Create Post', new_group_post_path(@group), data: { turbo_frame: 'modal' },
                                                                  class: 'inline-block text-gray-500 hover:text-gray-600 hover:bg-gray-50 rounded-t-lg p-4 text-sm font-medium text-center')
    links
  end
end
