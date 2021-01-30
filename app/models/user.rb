class User < ApplicationRecord
  has_many :usergroups
  has_many :workoutgroups, through: :usergroupss
  validates :username, presence: true, uniqueness: true
  has_secure_password
  
end
