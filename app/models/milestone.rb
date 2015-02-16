class Milestone < ActiveRecord::Base
  has_many :users, through: :milestone_users, dependent: :destroy
  has_many :milestone_users

  validates :referals_count, numericality: { only_integer: true }
end
