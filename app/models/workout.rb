class Workout < ApplicationRecord
  belongs_to :workout_group
  validates :name, presence: true
end
