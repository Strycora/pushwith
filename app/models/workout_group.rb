class WorkoutGroup < ApplicationRecord
  has_many :user_groups, :dependent => :delete_all
  has_many :users, through: :user_groups
  has_many :workouts, :dependent => :delete_all
  validates :name, presence: true

  accepts_nested_attributes_for :user_groups

  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end

end
