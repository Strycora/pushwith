class RemoveRoleFromUserGroups < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_groups, :role, :string
  end
end
