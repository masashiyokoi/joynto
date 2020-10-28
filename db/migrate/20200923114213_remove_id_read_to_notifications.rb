class RemoveIdReadToNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :id_read, :boolean
  end
end
