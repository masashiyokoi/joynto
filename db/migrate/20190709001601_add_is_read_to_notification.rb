class AddIsReadToNotification < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :id_read, :boolean
  end
end
