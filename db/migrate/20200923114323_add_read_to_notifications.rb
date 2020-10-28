class AddReadToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :read, :boolean, null: false, default: false
  end
end
