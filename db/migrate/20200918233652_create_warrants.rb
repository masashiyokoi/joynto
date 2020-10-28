class CreateWarrants < ActiveRecord::Migration[5.2]
  def change
    create_table :warrants do |t|
      t.integer :status, default: 0, null: false
      t.integer :price_per_hour
      t.integer :beneficiary_user_id
      t.integer :issuer_user_id
      t.datetime :start_datetime
      t.datetime :end_datetime

      t.timestamps
    end
  end
end
