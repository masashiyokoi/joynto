class CreateChannelUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :channel_users do |t|
      t.integer :channel_id
      t.integer :user_id

      t.timestamps
    end
  end
end
