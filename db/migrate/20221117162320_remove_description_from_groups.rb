class RemoveDescriptionFromGroups < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :description, :text
  end
end
