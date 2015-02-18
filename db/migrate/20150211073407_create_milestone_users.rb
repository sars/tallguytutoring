class CreateMilestoneUsers < ActiveRecord::Migration
  def change
    create_table :milestone_users do |t|
      t.integer :milestone_id
      t.integer :user_id
      t.boolean :awarded, default: false
    end
    add_index :milestone_users, [:milestone_id, :user_id], unique: true
  end
end
