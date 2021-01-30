class WorkoutGroup < ApplicationRecord
  has_many :usergroups
  has_many :users, through: :usergroups
  validates :name, presence: true
end
