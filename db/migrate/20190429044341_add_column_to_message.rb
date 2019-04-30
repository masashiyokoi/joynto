class AddColumnToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :messageable_type, :string
    add_column :messages, :messageable_id, :integer
  end
end
