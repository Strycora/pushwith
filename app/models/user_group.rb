class UserGroup < ApplicationRecord
  belongs_to :workout_group
  belongs_to :user

  validates_uniqueness_of :workout_group_id, scope: :user_id, message: " already contains this user"
  validates :mantra, presence: true 
  
end
