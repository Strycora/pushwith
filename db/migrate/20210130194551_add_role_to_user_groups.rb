class AddRoleToUserGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :user_groups, :role, :string
  end
end
