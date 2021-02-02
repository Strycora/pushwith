class Workout < ApplicationRecord
  belongs_to :workout_group
  validates :name, presence: true
  validates :sets, presence: true
  validates :reps, presence: true
  
end
