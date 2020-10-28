class AddColumnConnectedToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :connected, :boolean, null: false, default: false
  end
end
