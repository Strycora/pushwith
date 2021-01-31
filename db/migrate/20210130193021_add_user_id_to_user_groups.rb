class AddUserIdToUserGroups < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_groups, :user, null: false, foreign_key: true
  end
end
