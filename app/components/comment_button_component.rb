# frozen_string_literal: true

class CommentButtonComponent < ViewComponent::Base
  def initialize(record:, current_user:)
    @record = record
    @current_user = current_user
  end

  def comment_count
    @record.model_name.name == 'Post' ? @record.comments.count : @record.replies.count
  end

  def comment_path
    if @record.model_name.name == 'Post'
      new_group_post_comment_path(@record.group,
                                  @record, Comment.new)
    else
      group_post_comment_replies_path(
        @record.group, @record.post, @record, Comment.new
      )
    end
  end
end
