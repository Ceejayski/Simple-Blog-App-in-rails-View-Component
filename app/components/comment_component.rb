# frozen_string_literal: true

class CommentComponent < ViewComponent::Base
  with_collection_parameter :comment
  def initialize(comment:, current_user:)
    @comment = comment
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
      comment_links = [
        link_to('Edit', edit_group_post_comment_path(comment.post.group, comment.post, comment, comment),
                data: { turbo_frame: 'modal' }),
        link_to('Delete', group_post_comment_path(comment.post.group, comment.post, comment),
                data: { confirm: 'Are you sure?', turbo_method: 'delete' })
      ]
    end
    comment_links
  end
end
