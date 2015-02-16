class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, index: true, null: false
      t.string :ip_address, index: true, null: false
      t.string :token, index: true, null: false
      t.timestamp :confirmed_at
      t.integer :inviter_id

      t.timestamps null: false
    end
  end
end
