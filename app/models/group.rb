# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creator_id :bigint           not null
#
# Indexes
#
#  index_groups_on_creator_id  (creator_id)
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => users.id)
#
class Group < ApplicationRecord
  # Validations
  validates :title, presence: true, length: { maximum: 50 }, uniqueness: true

  # Associations
  belongs_to :creator, class_name: 'User'
  has_many :posts, dependent: :destroy
  has_and_belongs_to_many :members, join_table: 'groups_members', association_foreign_key: 'member_id',
                                    class_name: 'User', dependent: :destroy


  # scopes

  scope :most_recent, -> { order(updated_at: :desc) }

  def self.build_query(query:, user:)
    res = nil
    case query
    when 'all'
      res = Group.all
    when 'membership'
      res = user.groups
    when 'created_groups'
      res = user.created_groups
    else
      return []
    end

    res.most_recent
  end
end
