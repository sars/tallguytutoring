class CreateMilestoneUsers < ActiveRecord::Migration
  def change
    create_table :milestone_users do |t|
      t.integer :milestone_id
      t.integer :user_id
      t.boolean :awarded, default: false
    end
  end
end
