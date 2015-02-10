class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :ip_address
      t.string :token
      t.timestamp :confirmed_at
      t.integer :inviter_id

      t.timestamps null: false
    end
  end
end
