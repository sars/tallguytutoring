class User < ActiveRecord::Base
  has_many :milestones, through: :milestone_users
  has_many :milestone_users, dependent: :delete_all
  has_many :referals, class_name: User, foreign_key: :inviter_id
  belongs_to :inviter, class_name: User
  accepts_nested_attributes_for :milestone_users
  attr_accessor :ref

  validates :email, format: { with: /\A([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}\z/i }, uniqueness: true
  # validates :ip_address, uniqueness: true
  validates :token, uniqueness: true
end
