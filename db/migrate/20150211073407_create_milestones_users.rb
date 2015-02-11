class CreateMilestonesUsers < ActiveRecord::Migration
  def change
    create_table :milestones_users, id: false do |t|
      t.integer :milestone_id
      t.integer :user_id
      t.boolean :awarded
    end
  end
end
