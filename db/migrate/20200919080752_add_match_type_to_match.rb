class AddMatchTypeToMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :match_type, :integer
  end
end
