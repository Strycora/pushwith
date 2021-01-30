class UserGroup < ApplicationRecord
  belongs_to :WorkoutGroup
  belongs_to :User
end
