# frozen_string_literal: true

class SinglePostComponent < ViewComponent::Base
  with_collection_parameter :post

  def initialize(post:, current_user:)
    @post = post
    @current_user = current_user
  end

  def created_by
    @post.author == @current_user ? 'You' : @post.author.email
  end

  def post_button
    links = []
    if @post.author == @current_user
      links << (link_to 'Delete', url_for([@post.group, @post]), class: 'daisy-btn daisy-btn-danger',
                                                                 data: { confirm: 'Are you sure?', "turbo-method": :delete })
      links << (link_to 'Edit', edit_group_post_path(@post.group, @post), class: 'daisy-btn daisy-btn-primary',
                                                                          data: { turbo_frame: 'modal' })
    end
    links
  end
end
