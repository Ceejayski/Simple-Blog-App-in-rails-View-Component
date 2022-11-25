# == Schema Information
#
# Table name: comments
#
#  id                :bigint           not null, primary key
#  body              :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  parent_comment_id :bigint
#  post_id           :bigint           not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_comments_on_parent_comment_id  (parent_comment_id)
#  index_comments_on_post_id            (post_id)
#  index_comments_on_user_id            (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_comment_id => comments.id)
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :post
  belongs_to :parent_comment, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_comment_id', dependent: :destroy

  # Validations
  validates :body, presence: true
end
