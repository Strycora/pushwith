class User < ApplicationRecord
  has_many :user_groups
  has_many :workout_groups, through: :user_groups
  validates :username, presence: true, uniqueness: true
  has_secure_password
  
end
