class AddColumnTypeToChannels < ActiveRecord::Migration[5.2]
  def change
    add_column :channels, :type, :string, null: false
  end
end
