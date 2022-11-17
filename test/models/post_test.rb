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
require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
