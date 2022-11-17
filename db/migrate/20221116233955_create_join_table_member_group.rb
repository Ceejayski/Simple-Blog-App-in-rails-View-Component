class CreateJoinTableMemberGroup < ActiveRecord::Migration[7.0]
  def change
    create_join_table :members, :groups do |t|
      # t.index [:member_id, :group_id]
      # t.index [:group_id, :member_id]
    end
  end
end
