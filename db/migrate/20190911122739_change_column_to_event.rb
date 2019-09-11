class ChangeColumnToEvent < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :start_datetime, :start_time
  end
end
