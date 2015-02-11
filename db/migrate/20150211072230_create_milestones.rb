class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :referals_count
      t.string :description

      t.timestamps null: false
    end
  end
end
