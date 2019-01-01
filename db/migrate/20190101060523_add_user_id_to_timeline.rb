class AddUserIdToTimeline < ActiveRecord::Migration[5.2]
  def change
    add_column :timelines, :user_id, :integer, after: :type, null: false
  end
end
