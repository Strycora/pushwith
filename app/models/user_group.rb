class UserGroup < ApplicationRecord
  belongs_to :workout_group
  belongs_to :user

  validates :role, uniqueness: true, if :role == "Owner"
end
