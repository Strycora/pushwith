class WorkoutGroup < ApplicationRecord
  has_many :user_groups, :dependent => :delete_all
  has_many :users, through: :user_groups
  has_many :workouts, :dependent => :delete_all
  validates :name, presence: true


  accepts_nested_attributes_for :user_groups
  accepts_nested_attributes_for :workouts, reject_if: :all_blank


   scope :search, ->(query) {where("name LIKE ?", "%#{query}%")}


  def find_current_user_group(current_user)
    user_groups.where("user_id = ?", current_user.id).first
  end

end
