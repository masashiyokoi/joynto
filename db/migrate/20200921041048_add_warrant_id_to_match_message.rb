class AddWarrantIdToMatchMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :match_messages, :warrant_id, :integer
  end
end
