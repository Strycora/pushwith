class AddWorkoutGroupIdToUserGroups < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_groups, :workout_group, null: false, foreign_key: true
  end
end
