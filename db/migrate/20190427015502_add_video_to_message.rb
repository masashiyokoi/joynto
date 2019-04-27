class AddVideoToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :video, :string
  end
end
