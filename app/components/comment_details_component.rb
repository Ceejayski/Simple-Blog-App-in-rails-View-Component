# frozen_string_literal: true

class CommentDetailsComponent < ViewComponent::Base
  with_collection_parameter :comment

  def initialize(comment:, current_user:, repliable: true)
    @comment = comment
    @repliable = repliable
    @current_user = current_user
  end

  def comment_count
    @comment.replies&.size
  end

  def comment_path
    new_group_post_comment_reply_path(
      @comment.post.group, @comment.post, @comment, Comment.new
    )
  end

  def comment_links(comment)
    comment_links = []
    if comment.post.group.creator == @current_user || comment.user == @current_user
      # comment_links = [
      #   link_to('Edit', edit_group_post_comment_path(comment.post.group, comment.post, comment),
      #           data: { turbo_frame: 'modal' }, class: 'mr-2'),
      #   link_to('Delete', group_post_comment_path(comment.post.group, comment.post, comment),
      #           data: { confirm: 'Are you sure?', turbo_method: 'delete' }, class: 'mr-2')
      # ]
      comment_links << (link_to(edit_group_post_comment_path(comment.post.group, comment.post, comment),
                                data: { turbo_frame: 'modal' }, class: 'mr-2', title: 'Edit') do
                          content_tag(:i, '', class: 'fa fa-edit')
                        end)
      comment_links << (link_to(group_post_comment_path(comment.post.group, comment.post, comment),
                                data: { confirm: 'Are you sure?', turbo_method: 'delete' }, class: 'mr-2', title: 'Delete') do
                          content_tag(:i, '', class: 'fa fa-trash')
                        end)

    end
    comment_links
  end
end
