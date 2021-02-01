class AddMantraToUserGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :user_groups, :mantra, :string
  end
end
