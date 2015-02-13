class User < ActiveRecord::Base
  has_many :milestones, through: :milestone_users
  has_many :milestone_users, dependent: :delete_all
  has_many :referals, class_name: User, foreign_key: :inviter_id
  has_one :inviter, class_name: User
  belongs_to :inviter, class_name: User
  accepts_nested_attributes_for :milestone_users
end
