class AddProfileToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile, :text, after: :id
  end
end
