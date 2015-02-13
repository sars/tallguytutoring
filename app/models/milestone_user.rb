class MilestoneUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :milestone
end
