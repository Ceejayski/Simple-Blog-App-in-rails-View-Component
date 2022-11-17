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
    if @post.author == @current_user
      content_tag :div, class: 'daisy-btn-group' do
        link_to 'Delete', post_path(@post), data: { "turbo-method": :delete }, class: 'daisy-btn btn-danger'
        link_to 'Edit', edit_post_path(@post), class: 'daisy-btn btn-primary'
      end
    end
  end
end
