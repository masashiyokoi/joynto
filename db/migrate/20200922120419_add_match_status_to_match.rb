class AddMatchStatusToMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :match_status, :integer, null: false, default: 0
  end
end
