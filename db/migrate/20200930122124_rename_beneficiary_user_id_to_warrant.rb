class RenameBeneficiaryUserIdToWarrant < ActiveRecord::Migration[5.2]
  def change
    rename_column :warrants, :beneficiary_user_id, :owner_user_id
  end
end
