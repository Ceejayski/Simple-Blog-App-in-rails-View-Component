# frozen_string_literal: true

class GroupComponent < ViewComponent::Base
  with_collection_parameter :group

  def initialize(group:, current_user:)
    @group = group
    @current_user = current_user
  end

  def created_by
    @group.creator == @current_user ? 'You' : @group.creator.email
  end

  def group_button
    if @group.creator == @current_user
      link_to 'Delete', group_path(@group), data: { "turbo-method": :delete }, class: 'daisy-btn btn-danger'
    elsif @group.members.exists?(@current_user.id)
      link_to 'Leave', group_members_path(@group), data: { "turbo-method": :delete },
                                                   class: 'daisy-btn daisy-btn-danger daisy-btn-outline'
    else
      link_to 'Join', group_members_path(@group), data: { "turbo-method": :post },
                                                  class: 'daisy-btn daisy-btn-primary daisy-btn-outline'
    end
  end
end
