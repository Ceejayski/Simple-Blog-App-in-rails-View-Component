# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :bigint           not null
#  group_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#  index_posts_on_group_id   (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (group_id => groups.id)
#
class Post < ApplicationRecord
  # Validations

  validates :title, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :description, presence: true

  # Associations
  belongs_to :group
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  # scopes
  scope :most_recent, -> { order(updated_at: :desc) }
end
