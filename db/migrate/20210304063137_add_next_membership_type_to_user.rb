class AddNextMembershipTypeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :next_membership_type, :integer
  end
end
