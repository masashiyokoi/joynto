class AddKindToChannels < ActiveRecord::Migration[5.2]
  def change
    add_column :channels, :kind, :integer
  end
end
