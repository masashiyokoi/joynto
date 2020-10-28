class AddMembershipTypeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :membership_type, :integer, default: 0, null: false
  end
end
