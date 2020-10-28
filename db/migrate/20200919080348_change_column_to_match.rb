class ChangeColumnToMatch < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :request_id, :integer
    remove_column :matches, :accept_id, :integer
    remove_column :matches, :request_type, :string
    remove_column :matches, :accept_type, :string
  end
end
