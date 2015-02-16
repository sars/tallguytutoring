class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :referals_count, null: false
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
