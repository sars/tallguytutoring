class User < ActiveRecord::Base
  has_and_belongs_to_many :milestones
  has_one :inviter, class_name: User
  has_many :referals, class_name: User, foreign_key: :inviter_id
  belongs_to :inviter, class_name: User
end
