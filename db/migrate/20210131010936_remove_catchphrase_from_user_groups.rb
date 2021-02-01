class RemoveCatchphraseFromUserGroups < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_groups, :catchphrase, :string
  end
end
