class RemoveTypeToChannels < ActiveRecord::Migration[5.2]
  def change
    remove_column :channels, :type, :integer
  end
end
