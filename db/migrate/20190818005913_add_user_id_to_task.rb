class AddUserIdToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :user_id, :integer, :null => false, after: :status
  end
end
