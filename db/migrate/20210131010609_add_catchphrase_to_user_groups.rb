class AddCatchphraseToUserGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :user_groups, :catchphrase, :string
  end
end
