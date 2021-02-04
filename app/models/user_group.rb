class UserGroup < ApplicationRecord
  belongs_to :workout_group
  belongs_to :user

  #validates :user_id, uniqueness: { message: " is already in the group"}
  validates :mantra, presence: true 
  
end
