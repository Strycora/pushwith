class AddWorkoutGroupIdToWorkouts < ActiveRecord::Migration[6.1]
  def change
    add_reference :workouts, :workout_group, null: false, foreign_key: true
  end
end
