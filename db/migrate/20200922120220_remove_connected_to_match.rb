class RemoveConnectedToMatch < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :connected, :boolean, null: false, default: false
  end
end
