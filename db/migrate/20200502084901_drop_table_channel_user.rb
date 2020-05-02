class DropTableChannelUser < ActiveRecord::Migration[5.2]
  def change
    drop_table :channel_users
  end
end
