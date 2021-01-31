class WorkoutGroup < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  validates :name, presence: true

  accepts_nested_attributes_for :user_groups
end
